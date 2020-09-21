//
//  ViewController.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 05/08/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import DropDown
import UIKit

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var sourceUnitLabel: UILabel!
    @IBOutlet weak var targetUnitLabel: UILabel!
    
    @IBOutlet weak var leftDropdownView: UIView!
    @IBOutlet weak var rightDropdownView: UIView!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var navbarTitleLabel: UINavigationItem!
    
    
    var unit: Unit?
    
    let converterBrain = ConverterBrain()
    
    let leftMenu = DropDown()
    let rightMenu = DropDown()

    var resultString: String?
    var results: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropdownMenuConfig() // configuring dropdown's dataSource
        styleConfig() // configuring dropdown's styles
        
        // When arriving to 'ConverterScreen' => hide tabbar
        self.tabBarController?.tabBar.isHidden = true
        textField.attributedPlaceholder = NSAttributedString(string: "Insert value", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        if let safeUnit = unit?.unitLabel {
            // setting navbarTitleLabel to the argument passed in 'MeasureViewController'
            navbarTitleLabel.title = safeUnit
        }
        
    }
    
    
    @IBAction func leftDropdownPressed(_ sender: UIButton) {
        leftMenu.show()
        
        // Left dropdownMenu pressed
        leftMenu.selectionAction = { [unowned self] (index: Int, item: String) in
            
            self.converterBrain.changePlaceholderItem(item: item, textField: self.textField)
            
            // Reassign the dataSource to the not changed dropdownData
            if let dropdownData = self.unit?.dropdownData! {
                self.rightMenu.dataSource = dropdownData
            }
            
            // Find and remove the selected element in the right dropdown
            let elementIndex = self.converterBrain.indexOf(items: self.rightMenu.dataSource, element: item)
            self.rightMenu.dataSource.remove(at: elementIndex)
            
            // Assign the label's text to 'item'
            self.sourceUnitLabel.text = item
            self.targetUnitLabel.text = "?"
        }
    }
    
    
    @IBAction func rightDropdownPressed(_ sender: UIButton) {
        rightMenu.show()
        
        // If question was not added to rightMenu's dropdown list => insert it at position 0
        if rightMenu.dataSource.contains("?") == false {
            rightMenu.dataSource.insert("?", at: 0)
        }
        
        // Left dropdownMenu pressed
        rightMenu.selectionAction = { [unowned self] (index: Int, item: String) in
            // Assign the label's text to item
            self.targetUnitLabel.text = item
        }
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if textField.text == "" {
//                SCLAlertView().showError("Error", subTitle: "Input error: you must specify an input value 🤯")
        }
        
        if let dropdownData = unit?.dropdownData, let sourceUnit = leftMenu.selectedItem {
            // Converting standard measures
            
            guard let textFieldValue = textField.text else {
//                SCLAlertView().showError("Error", subTitle: "You must specify an input value 🤯")
                return print("Input value cannot be nil")
            }
            
            let targetUnit = rightMenu.selectedItem
            
            if unit is StandardUnit {
                
                let standardUnit = unit as! StandardUnit
                
                // In all cases replace ',' with '.'
                let formattedTextFieldValue: String = converterBrain.replaceCharAt(textFieldValue: textFieldValue, replaceChar: ".", charToReplace: ",")

                
                results = converterBrain.convertToUnit(value: Float(formattedTextFieldValue) ?? 0, unitsRelations: standardUnit.unitsRelations, sourceUnit: sourceUnit, targetUnit: targetUnit ?? "?", baseUnit: dropdownData[0])
                
                performSegue(withIdentifier: K.segueIdToResult, sender: self)
            } else {
                let proUnit = unit as! ProUnit
                switch proUnit.unitLabel {
                case K.proUnitLabels[0]:
                    print(proUnit.unitLabel)
                    results = converterBrain.colorsConvert(textFieldValue: textFieldValue, sourceUnit: sourceUnit)
                    self.performSegue(withIdentifier: K.segueIdToResult, sender: self)
                case K.proUnitLabels[1]:
                    results = converterBrain.binaryConvert(textFieldValue: textFieldValue, sourceUnit: sourceUnit, targetUnit: targetUnit ?? "?")
                    self.performSegue(withIdentifier: K.segueIdToResult, sender: self)
                case K.proUnitLabels[2]:
                    converterBrain.currencyConvert(textFieldValue: textFieldValue, sourceUnit: sourceUnit, targetUnit: targetUnit ?? "?") { (results, error) in
                        if let err = error {
                            print(err)
                            return
                        }
                        print(results)
                        self.results = results
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: K.segueIdToResult, sender: self)
                        }
                    }
                default:
                    print("Other units...")
                }
            }
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segueIdToResult {
            let destinationVC = segue.destination as! ResultViewController
            if let safeResults = results {
                print("Here result is equal to nil")
                destinationVC.results = safeResults
            }
            destinationVC.sourceUnit = sourceUnitLabel.text
            destinationVC.targetUnit = targetUnitLabel.text
        }
    }
    
    
    private func dropdownMenuConfig() {
        if let safeDropdownData = unit?.dropdownData {
            leftMenu.dataSource = safeDropdownData
            leftMenu.width = K.dropdownWidth
            leftMenu.anchorView = leftDropdownView
            
            rightMenu.dataSource = safeDropdownData
            rightMenu.width = K.dropdownWidth
            rightMenu.anchorView = rightDropdownView
            
            leftMenu.cornerRadius = K.cornerRadius
            rightMenu.cornerRadius = K.cornerRadius
        }
    }
    
    private func styleConfig() {
        textField.layer.cornerRadius = K.cornerRadius
        calculateButton.layer.cornerRadius = K.cornerRadius
        
        leftDropdownView.layer.shadowColor = UIColor.black.cgColor
        leftDropdownView.layer.shadowOffset = .zero
        leftDropdownView.layer.shadowOpacity = 0.5
        leftDropdownView.layer.shadowRadius = 10
    }
    
    
}
