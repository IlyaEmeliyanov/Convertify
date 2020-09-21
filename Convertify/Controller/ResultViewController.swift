//
//  ResultViewController.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 06/08/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var goBackButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var results: [String]?
    
    var sourceUnit: String?
    var targetUnit: String?
    var resultsDecimal: [String]?
    var resultFraction: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: K.tableViewCellId)
        
        tableView.delegate = self
        tableView.dataSource = self
            
        styleConfig()

//         Do any additional setup after loading the view.
        if targetUnit != K.standardUnits[0].unitLabel { // if the unitLabel != length
            segmentedControl.removeSegment(at: 1, animated: true)
        }
        
    }

    @IBAction func goBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
                case 0:
                    if resultsDecimal == nil {
                        resultsDecimal = results
                    }
//                case 1:
//                    if resultFraction == nil {
//                        let resultFloat = Float(result!)
//                        let decimal = resultFloat!.truncatingRemainder(dividingBy: 1.0)
//        
//                        let wholeLabel = String(format: "%.0f", resultFloat!-decimal)
//                        let fractionLabel = String(format: "%.0f", round(decimal * 64))
//        
//                        if targetUnit == K.foot {
//                            wholeLabel += "'"
//                        } else if targetUnit == K.inch {
//                            wholeLabel += "''"
//                        }
//        
//                        resultFraction = "\(wholeLabel) \(fractionLabel)/64"
//                    }
//        
//                    resultLabel.text = resultFraction
                default:
                    return
                }
        
    }
    
    func styleConfig() {
        goBackButton.layer.cornerRadius = K.cornerRadius
        tableView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        tableView.layer.cornerRadius = K.cornerRadius
    }
    
}

//MARK: - UITableViewDelegate
extension ResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}


//MARK: - UITableViewDataSource
extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tableViewCellId) as! MyTableViewCell
        
        cell.configure(labelViewText: results![indexPath.row])
        
        return cell
    }
    
}
