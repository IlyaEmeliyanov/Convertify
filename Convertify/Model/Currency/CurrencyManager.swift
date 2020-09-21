//
//  CurrencyManager.swift
//  Unit Converter
//
//  Created by Ilya Emeliyanov on 15/09/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit

struct Currency: Codable {
    var base: String
    var rates: [String: Float]
}

struct CurrencyManager {
    
    func performRequest(options: String, base: String, completed: @escaping (Currency?, Error?) -> ()) -> Currency? {
        let currencyURL: String = "https://api.exchangeratesapi.io"
        let urlString = "\(currencyURL)/\(options)?base=\(base)"
        
        guard let url = URL(string: urlString) else {return nil}
        
        var base: String = ""
        var rates: [String: Float] = ["": 0]
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                completed(nil, err)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Currency.self, from: data!)
                
                base = decodedData.base
                rates = decodedData.rates
                
                completed(Currency(base: base, rates: rates), nil)
            }
            catch let jsonErr {
                completed(nil, jsonErr)
                return
            }
        }.resume()

        return nil
    }
    
}

