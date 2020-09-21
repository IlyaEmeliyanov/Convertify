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
    
    init(measureLabel: String, dropdownData: [String]) {
        self.unitLabel = measureLabel
        self.dropdownData = dropdownData
    }
    
}

class StandardUnit: Unit {
    var unitsRelations: [String: Float]
    
    init(measureLabel: String, dropdownData: [String], unitsRelations: [String: Float]) {
        self.unitsRelations = unitsRelations
        super.init(measureLabel: measureLabel, dropdownData: dropdownData)
    }
}


class ProUnit: Unit {
    
}
