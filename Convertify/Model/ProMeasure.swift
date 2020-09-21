//
//  ProMeasure.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 01/09/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit

protocol ProMeasureRGBDelegate {
    func fromRGBToHex(r: Int, g: Int, b: Int)
    func fromHexToRGB(hex: String)
    func fromHSLToHex(h: Int, s: Int, l: Int)
    func fromHSBToHex(h: Int, s: Int, b: Int)
}



struct ProMeasure {
    let measureLabel: String
    let dropdownData: [String]
}
