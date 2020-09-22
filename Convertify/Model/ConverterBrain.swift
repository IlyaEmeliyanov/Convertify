//
//  ConverterBrain.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 13/08/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit


struct ConverterBrain {

    
//MARK: - Utils
    
    // Replacing character at specific index
    func replaceCharAt(textFieldValue: String, replaceChar: String, charToReplace: String) -> String {
        
        var formattedTextFieldValue = ""
        
        for char in textFieldValue {
            if "\(char)" != charToReplace {
                formattedTextFieldValue += "\(char)"
            }else {
                formattedTextFieldValue += replaceChar
            }
        }
        return formattedTextFieldValue
    }
    
    // Finding index of a specific element in the array
    func indexOf(items: [String], element: String) -> Int {
        var index = 0
        var position = 0
        for _ in items {
            if items[index] == element {
                position = index
            }
            index += 1
        }
        return position
    }
    
    
    
//MARK: - Standard Unit
    
    func convertToUnit(value: Float, unitsRelations: [String: Float], sourceUnit: String, targetUnit: String, baseUnit: String) -> [String] {
        var newValue = value
        var results: [String] = []
        
        // If the target unit is undefined => convert to all units
        if targetUnit == "?" {
            for unit in unitsRelations {
                newValue = getResults(value, unitsRelations, sourceUnit, unit.key, baseUnit)
                results.append("\(newValue) \(unit.key)")
            }
        }
        // Otherwise convert to the target unit
        else {
            newValue = getResults(value, unitsRelations, sourceUnit, targetUnit, baseUnit)
            results.append("\(newValue) \(targetUnit)")
        }
        
        return results
    }
    
    func getResults(_ value: Float, _ unitsRelations: [String: Float], _ sourceUnit: String, _ targetUnit: String, _ baseUnit: String) -> Float {
        var newValue = sourceUnit == baseUnit ? value * unitsRelations[targetUnit]! : (value * (unitsRelations[targetUnit]!/unitsRelations[sourceUnit]!))
        newValue = round(newValue*1000000)/1000000
        return newValue
    }
    
//MARK: - Pro Unit
    
    
    
    // Colors
    func colorsConvert(textFieldValue: String, sourceUnit: String) -> [String] {
        var results: [String] = []
        switch sourceUnit {
        case K.proUnits[0].dropdownData![0]:
            let rgb = textFieldValue.components(separatedBy: " ")
            if rgb.count == 3 {
                let red: Int = Int(rgb[0])!
                let green: Int = Int(rgb[1])!
                let blue: Int = Int(rgb[2])!
                
                results.append(UIColor().fromRGBToHex(r: red, g: green, b: blue))
            }
            break
        case K.proUnits[0].dropdownData![1]:
            var hex = textFieldValue
            if hex.hasPrefix("#") {
                hex.remove(at: hex.startIndex)
            }
            
            var letters: [String] = []
            for letter in hex {
                letters.append(String(letter.uppercased()))
            }
            if letters.count == 6 {
                results.append(UIColor().fromHexToRGB(hex: letters))
            }
            break
        default:
            print("Hello")
        }
        return results
    }
    
    func changePlaceholderItem(item: String, textField: UITextField) {
        if item == K.proUnits[0].dropdownData![0] {
            textField.placeholder = "e.g. red green blue"
        } else if item == K.proUnits[0].dropdownData![1] {
            textField.placeholder = "e.g. ffffff"
        } else {
            textField.placeholder = "Insert value"
        }
    }
    
    
    
    // Binary
    func binaryConvert(textFieldValue: String, sourceUnit: String, targetUnit: String) -> [String] {
        var results: [String] = []
        switch sourceUnit {
        case K.proUnits[1].dropdownData![0]:
            results.append(contentsOf: ["Dec: \(fromBinToDec(number: textFieldValue))", "Hex: \(fromBinToHex(number: textFieldValue))"])
            break
        case K.proUnits[1].dropdownData![1]:
            results.append(contentsOf: ["Bin: \(fromDecToBin(number: textFieldValue))", "Hex: \(fromDecToHex(number: textFieldValue))"])
            break
        case K.proUnits[1].dropdownData![2]:
            results.append(contentsOf: ["Dec: \(fromHexToDec(number: textFieldValue))", "Bin: \(fromHexToBin(number: textFieldValue))"])
            break
        case K.proUnits[1].dropdownData![3]:
            print("Octal")
            break
        default:
            print("Default")
        }
        return results
    }
    
    // Decimal -> Binary
    func fromDecToBin(number: String) -> String {
        let numberInt = Int(number)!
        return String(numberInt, radix: 2)
    }
    // Decimal -> Hexadecimal
    func fromDecToHex(number: String) -> String {
        let numberInt = Int(number)!
        return String(numberInt, radix: 16)
    }

    // Binary -> Decimal
    func fromBinToDec(number: String) -> String {
        return String(Int(number, radix: 2)!)
    }
    // Binary -> Hexadecimal
    func fromBinToHex(number: String) -> String {
        String(Int(number, radix: 2)!, radix: 16)
    }

    // Hexadecimal -> Decimal
    func fromHexToDec(number: String) -> String {
        return String(Int(number, radix: 16)!)
    }
    // Hexadecimal -> Binary
    func fromHexToBin(number: String) -> String{
        return String(Int(number, radix: 16)!, radix: 2)
    }
    
    
    
    // Currency
    func currencyConvert(textFieldValue: String, sourceUnit: String, targetUnit: String, completed: @escaping ([String]?, Error?) -> ()) {
        var results: [String] = []
        let value = Float(textFieldValue) ?? 0
        
        CurrencyManager().performRequest(options: "latest", base: "EUR") { (currency, error) in
            if let err = error {
                completed(nil, err)
            }
            results = self.convertToUnit(value: value, unitsRelations: currency!.rates, sourceUnit: sourceUnit, targetUnit: targetUnit, baseUnit: "EUR")
            
            completed(results, nil)
        }
    }
    
}
