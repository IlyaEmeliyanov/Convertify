//
//  StandardFeatures.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 01/09/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit

class Unit {
    let unitLabel: String
    var dropdownData: [String]?
    let card: Card
    
    init(unitLabel: String, dropdownData: [String], card: Card) {
        self.unitLabel = unitLabel
        self.dropdownData = dropdownData
        self.card = card
    }
    
}

class StandardUnit: Unit {
    var unitsRelations: [String: Float]
    
    init(unitLabel: String, dropdownData: [String], unitsRelations: [String: Float], card: Card) {
        self.unitsRelations = unitsRelations
        super.init(unitLabel: unitLabel, dropdownData: dropdownData, card: card)
    }
}


class ProUnit: Unit {
    
}
