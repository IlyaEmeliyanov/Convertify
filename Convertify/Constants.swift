//
//  Constants.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 06/08/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit

struct K {
    static let screenNames: [String] = ["Standard Features", "Pro Features", "Favourites"]
    
    
    static let standardUnitLabels = ["Length", "Area", "Volume", "Energy", "Digital Storage"]
    static let standardUnits: [Unit] = [
        StandardUnit(measureLabel: standardUnitLabels[0], dropdownData: ["m", "cm", "mm", "km", "mile", "inch", "foot", "yard"], unitsRelations: ["m": 1.0, "cm": 100.0, "mm": 1000.0, "km": 0.001, "mile": 0.0006214, "inch": 39.37, "foot": 3.28, "yard": 1.09361]),
        StandardUnit(measureLabel: standardUnitLabels[1], dropdownData: ["m^2", "cm^2", "mm^2", "km^2", "mile^2", "inch^2", "foot^2", "yard^2"], unitsRelations: ["m^2": 1.0, "cm^2": 1.0e+4, "mm^2": 1.0e+9, "km^2": 1.0e-9, "mile^2": 3.861e-7, "inch^2": 1550, "foot^2": 10.76, "yard^2": 1.195983]),
        StandardUnit(measureLabel: standardUnitLabels[2], dropdownData: ["m^3", "dm^3/l", "cm^3", "mm^3", "inch^3", "foot^3", "gallon"], unitsRelations: ["m^3": 1.0, "dm^3/l": 1.0e+3, "cm^3": 1.0e+6, "mm^3": 1.0e+9, "inch^3": 61024, "foot^3": 35.3147, "gallon": 220.0]),
        StandardUnit(measureLabel: standardUnitLabels[3], dropdownData: ["Joule", "Kilojoule", "Gram calorie", "Kilocalorie", "Watt hour", "Kilowatt hour", "Electronvolt"], unitsRelations: ["Joule": 1.0, "Kilojoule": 0.001, "Gram calorie": 0.239, "Kilocalorie": 0.000239, "Watt hour": 0.00028, "Kilowatt hour": 2.7778e-7, "Electronvolt": 6.242e+18]),
        StandardUnit(measureLabel: standardUnitLabels[4], dropdownData: ["Byte", "KiloByte", "MegaByte", "Gigabyte", "Terabyte", "Bit", "KiloBit", "Megabit", "Gigabit", "Terabit"], unitsRelations: ["Byte": 1.0, "KiloByte": 1e-3, "MegaByte": 1e-6, "Gigabyte": 1e-9, "Terabyte": 1e-12, "Bit": 8.0, "KiloBit": 8e-3, "Megabit": 8e-6, "Gigabit": 8e-9, "Terabit": 8e-12])
    ]
    
    static let proUnitLabels = ["RGB", "Binary", "Currency"]
    static let proUnits: [Unit] = [
        ProUnit(measureLabel: proUnitLabels[0], dropdownData: ["RGB", "Hex"]),
        ProUnit(measureLabel: proUnitLabels[1], dropdownData: ["Binary", "Decimal", "Hex", "Octal"]),
        ProUnit(measureLabel: proUnitLabels[2], dropdownData: ["ZAR", "DKK", "HUF", "PHP", "PLN", "INR", "SEK", "RUB", "HRK", "BRL", "GBP", "SGD", "IDR", "MYR", "BGN", "USD", "CZK", "MXN", "NZD", "ILS", "HKD", "ISK", "JPY", "THB", "TRY", "NOK", "RON", "CAD", "CHF", "CNY", "KRW", "AUD"])
    ]
    
    
    static let cornerRadius: CGFloat = 10
    
    static let dropdownWidth: CGFloat = 150
    
    static let segueIdToResult = "goToResult"
    static let segueIdToConverter = "goToConverter"
    
    static let tableViewCellId = "MyTableViewCell"
    static let collectionViewCellId = "MyCollectionViewCell"
    
    static let standardCards: [Card] = [
        Card(label: "Length", image: UIImage(named: "LengthIcon")!, labelColor: UIColor(named: "LengthFontColor")!),
        Card(label: "Area", image: UIImage(named: "AreaIcon")!, labelColor: UIColor(named: "AreaFontColor")!),
        Card(label: "Volume", image: UIImage(named: "VolumeIcon")!, labelColor: UIColor(named: "VolumeFontColor")!),
        Card(label: "Energy", image: UIImage(named: "EnergyIcon")!, labelColor: UIColor(named: "EnergyFontColor")!),
        Card(label: "Digital Storage", image: UIImage(named: "StorageIcon")!, labelColor: UIColor(named: "StorageFontColor")!),
    ]
    
    static let proCards: [Card] = [
        Card(label: "RGB", image: UIImage(named: "RGBIcon")!, labelColor: UIColor(named: "RGBFontColor")!),
        Card(label: "Binary", image: UIImage(named: "BinaryIcon")!, labelColor: UIColor(named: "BinaryFontColor")!),
        Card(label: "Currency", image: UIImage(named: "CurrencyIcon")!, labelColor: UIColor(named: "CurrencyFontColor")!),
    ]
    
}
