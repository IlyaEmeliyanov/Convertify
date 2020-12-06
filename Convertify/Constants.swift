//
//  Constants.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 06/08/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit

struct K {
    
//    Screen Names
    static let screenNames: [String] = ["Standard", "Pro", "Favorites"]
    
//    STANDARD
    static let standardUnitLabels = ["Length", "Area", "Volume", "Energy", "Digital Storage"]
    static let standardDropdownData: [String: [String]] = [
        standardUnitLabels[0]: ["m", "cm", "mm", "km", "mile", "inch", "foot", "yard"],
        standardUnitLabels[1]: ["m^2", "cm^2", "mm^2", "km^2", "mile^2", "inch^2", "foot^2", "yard^2"],
        standardUnitLabels[2]: ["m^3", "dm^3/l", "cm^3", "mm^3", "inch^3", "foot^3", "gallon"],
        standardUnitLabels[3]: ["Joule", "Kilojoule", "Gram calorie", "Kilocalorie", "Watt hour", "Kilowatt hour", "Electronvolt"],
        standardUnitLabels[4]: ["Byte", "KiloByte", "MegaByte", "Gigabyte", "Terabyte", "Bit", "KiloBit", "Megabit", "Gigabit", "Terabit"]
    ]
    static let standardUnitsRelations: [String: [String: Float]] = [
        standardUnitLabels[0]: ["m": 1.0, "cm": 100.0, "mm": 1000.0, "km": 0.001, "mile": 0.0006214, "inch": 39.37, "foot": 3.28, "yard": 1.09361],
        standardUnitLabels[1]: ["m^2": 1.0, "cm^2": 1.0e+4, "mm^2": 1.0e+9, "km^2": 1.0e-9, "mile^2": 3.861e-7, "inch^2": 1550, "foot^2": 10.76, "yard^2": 1.195983],
        standardUnitLabels[2]: ["m^3": 1.0, "dm^3/l": 1.0e+3, "cm^3": 1.0e+6, "mm^3": 1.0e+9, "inch^3": 61024, "foot^3": 35.3147, "gallon": 220.0],
        standardUnitLabels[3]: ["Joule": 1.0, "Kilojoule": 0.001, "Gram calorie": 0.239, "Kilocalorie": 0.000239, "Watt hour": 0.00028, "Kilowatt hour": 2.7778e-7, "Electronvolt": 6.242e+18],
        standardUnitLabels[4]: ["Byte": 1.0, "KiloByte": 1e-3, "MegaByte": 1e-6, "Gigabyte": 1e-9, "Terabyte": 1e-12, "Bit": 8.0, "KiloBit": 8e-3, "Megabit": 8e-6, "Gigabit": 8e-9, "Terabit": 8e-12]
    ]

    static let standardUnits: [Unit] = [
        StandardUnit(unitLabel: standardUnitLabels[0], dropdownData: standardDropdownData[standardUnitLabels[0]]!, unitsRelations: standardUnitsRelations[standardUnitLabels[0]]!, card: standardCards[0]),
        StandardUnit(unitLabel: standardUnitLabels[1], dropdownData: standardDropdownData[standardUnitLabels[1]]!, unitsRelations: standardUnitsRelations[standardUnitLabels[1]]!, card: standardCards[1]),
        StandardUnit(unitLabel: standardUnitLabels[2], dropdownData: standardDropdownData[standardUnitLabels[2]]!, unitsRelations: standardUnitsRelations[standardUnitLabels[2]]!, card: standardCards[2]),
        StandardUnit(unitLabel: standardUnitLabels[3], dropdownData: standardDropdownData[standardUnitLabels[3]]!, unitsRelations: standardUnitsRelations[standardUnitLabels[3]]!, card: standardCards[3]),
        StandardUnit(unitLabel: standardUnitLabels[4], dropdownData: standardDropdownData[standardUnitLabels[4]]!, unitsRelations: standardUnitsRelations[standardUnitLabels[4]]!, card: standardCards[4]),
    ]
    
    
//    PRO
    static let proUnitLabels: [String] = ["RGB", "Binary", "Currency"]
    static let proDropdownData: [String: [String]] = [
        proUnitLabels[0]: ["RGB", "Hex"],
        proUnitLabels[1]: ["Binary", "Decimal", "Hex", "Octal"],
        proUnitLabels[2]: ["ZAR", "DKK", "HUF", "PHP", "PLN", "INR", "SEK", "RUB", "HRK", "BRL", "GBP", "SGD", "IDR", "MYR", "BGN", "USD", "CZK", "MXN", "NZD", "ILS", "HKD", "ISK", "JPY", "THB", "TRY", "NOK", "RON", "CAD", "CHF", "CNY", "KRW", "AUD"]
    ]
    static let proUnits: [Unit] = [
        ProUnit(unitLabel: proUnitLabels[0], dropdownData: proDropdownData[proUnitLabels[0]]!, card: proCards[0]),
        ProUnit(unitLabel: proUnitLabels[1], dropdownData: proDropdownData[proUnitLabels[1]]!, card: proCards[1]),
        ProUnit(unitLabel: proUnitLabels[2], dropdownData: proDropdownData[proUnitLabels[2]]!, card: proCards[2])
    ]
    
    
//    Icons
    static let icons: [String: UIImage] = [
        standardUnitLabels[0]: UIImage(systemName: "ruler.fill")!,
        standardUnitLabels[1]: UIImage(named: "AreaIcon")!,
        standardUnitLabels[2]: UIImage(named: "VolumeIcon")!,
        standardUnitLabels[3]: UIImage(systemName: "lightbulb.fill")!,
        standardUnitLabels[4]: UIImage(systemName: "server.rack")!,
        proUnitLabels[0]: UIImage(named: "RGBIcon")!,
        proUnitLabels[1]: UIImage(named: "BinaryIcon")!,
        proUnitLabels[2]: UIImage(named: "CurrencyIcon")!,
    ]
    
//    Font Colors
    static let fontColors: [String: UIColor] = [
        standardUnitLabels[0]: UIColor(named: "LengthFontColor")!,
        standardUnitLabels[1]: UIColor(named: "AreaFontColor")!,
        standardUnitLabels[2]: UIColor(named: "VolumeFontColor")!,
        standardUnitLabels[3]: UIColor(named: "EnergyFontColor")!,
        standardUnitLabels[4]: UIColor(named: "StorageFontColor")!,
        proUnitLabels[0]: UIColor(named: "RGBFontColor")!,
        proUnitLabels[1]: UIColor(named: "BinaryFontColor")!,
        proUnitLabels[2]: UIColor(named: "CurrencyFontColor")!,
    ]
    
//    FAVORITES
    static var favoriteUnitLabels: [String] = []
    
    static var favoriteUnits: [Unit] = []
    
    struct Favorites {
        static func setFavorites(labelView: UILabel, isFavorite: Bool) {
            if let label = labelView.text {
                if isFavorite {
                    favoriteUnitLabels.append(label)
                } else {
                    guard let indexRemove = favoriteUnitLabels.firstIndex(of: label) else {return}
                    favoriteUnitLabels.remove(at: indexRemove)
                }
            }
        }
        
        static func getFavorites(favoriteUnitLabels: [String]) -> [Unit] {
            var filteredUnits: [Unit] = []
            
            for label in favoriteUnitLabels {
                if standardUnitLabels.contains(label) {
                    let standardUnit = standardUnits.filter({ unit in
                        return unit.unitLabel == label
                    })
                    filteredUnits.append(contentsOf: standardUnit)
                } else {
                    let proUnit = proUnits.filter({ unit in
                        return unit.unitLabel == label
                    })
                    filteredUnits.append(contentsOf: proUnit)
                }
            }

            return filteredUnits
        }
    }
    
    
    static let cornerRadius: CGFloat = 10
    
    static let dropdownWidth: CGFloat = 150
    
    static let segueIdToResult = "goToResult"
    static let segueIdToConverter = "goToConverter"
    
    static let tableViewCellId = "MyTableViewCell"
    static let collectionViewCellId = "MyCollectionViewCell"
    
    static let standardCards: [Card] = [
        Card(label: standardUnitLabels[0], image: icons[standardUnitLabels[0]]!, labelColor: fontColors[standardUnitLabels[0]]!),
        Card(label: standardUnitLabels[1], image: icons[standardUnitLabels[1]]!, labelColor: fontColors[standardUnitLabels[1]]!),
        Card(label: standardUnitLabels[2], image: icons[standardUnitLabels[2]]!, labelColor: fontColors[standardUnitLabels[2]]!),
        Card(label: standardUnitLabels[3], image: icons[standardUnitLabels[3]]!, labelColor: fontColors[standardUnitLabels[3]]!),
        Card(label: standardUnitLabels[4], image: icons[standardUnitLabels[4]]!, labelColor: fontColors[standardUnitLabels[4]]!),
    ]
    
    static let proCards: [Card] = [
        Card(label: proUnitLabels[0], image: icons[proUnitLabels[0]]!, labelColor: fontColors[proUnitLabels[0]]!),
        Card(label: proUnitLabels[1], image: icons[proUnitLabels[1]]!, labelColor: fontColors[proUnitLabels[1]]!),
        Card(label: proUnitLabels[2], image: icons[proUnitLabels[2]]!, labelColor: fontColors[proUnitLabels[2]]!),
    ]
    
}
