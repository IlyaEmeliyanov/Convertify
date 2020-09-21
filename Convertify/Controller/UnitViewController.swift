//
//  MeasureViewController.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 20/08/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit
import GradientView // importing gradient enabler

class UnitViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navItem: UINavigationItem!
    
    var selectedCollectionViewItemLabel: String?
    var collectionViewItemLabels: [String]?
    
    var units: [Unit]?
    var cards: [Card]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding gradients and styling view
        styleConfig()
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: K.collectionViewCellId)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    private func styleConfig() {
        var color1 = UIColor(red: 248/255, green: 123/255, blue: 170/255, alpha: 1)
        var color2 = UIColor(red: 185/255, green: 39/255, blue: 94/255, alpha: 0.8)
        
        switch navItem.title {
        case K.screenNames[0]:
            color1 = UIColor(red: 248/255, green: 123/255, blue: 170/255, alpha: 1)
            color2 = UIColor(red: 185/255, green: 39/255, blue: 94/255, alpha: 0.8)
            units = K.standardUnits
            cards = K.standardCards
            break
        case K.screenNames[1]:
            color1 = UIColor(red: 45/255, green: 53/255, blue: 227/255, alpha: 0.8)
            color2 = UIColor(red: 192/255, green: 60/255, blue: 238/255, alpha: 1)
            units = K.proUnits
            cards = K.proCards
            break
        case K.screenNames[2]:
            color1 = UIColor(red: 238/255, green: 60/255, blue: 60/255, alpha: 1)
            color2 = UIColor(red: 248/255, green: 1, blue: 202/255, alpha: 0.8)
            units = K.standardUnits
            cards = K.standardCards
            break
        default:
            break
        }
        
        addGradientToView(x: -80, y: -100, width: 355, height: 355, colors: [color1, color2], locations: [0.1, 1])
        
        
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 140.0, height: 170.0)
    }
    
    
    private func addGradientToView(x: Int, y: Int, width: Int, height: Int, colors: [UIColor], locations: [CGFloat]) {
        let gradientView = GradientView(frame: CGRect(x: x, y: y, width: width, height: height))
        
        // Set the gradient colors
        gradientView.colors = colors
        
        // Optionally set some locations
        gradientView.locations = locations
        
        // Optionally change the direction. The default is vertical.
        gradientView.direction = .vertical
        
        // Rotate view by 22.5°/(π/8)
        gradientView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 8)
        
        gradientView.layer.cornerRadius = K.cornerRadius * 2
        gradientView.layer.masksToBounds = true
        
        // Add it as a subview in all of its awesome
        view.insertSubview(gradientView, at: 0)
    }
    
    
}


//MARK: - UICollectionViewDelegate
extension UnitViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        selectedCollectionViewItemLabel = cards?[indexPath.row].label
        
        self.performSegue(withIdentifier: K.segueIdToConverter, sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        
        var myUnit: Unit?
        
        for unit in units! {
            if unit.unitLabel == selectedCollectionViewItemLabel {
                myUnit = unit is StandardUnit ? unit as! StandardUnit: unit as! ProUnit
            }
        }
        
        let destinationVC = segue.destination as! ConverterViewController
        destinationVC.unit = myUnit
    }
    
}


//MARK: - UICollectionViewDataSource
extension UnitViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionViewCellId, for: indexPath) as! MyCollectionViewCell
        
        if let safeCards = cards {
            cell.configure(card: safeCards[indexPath.row])
        }
        
        return cell
        
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension UnitViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140.0, height: 170.0)
    }
}
