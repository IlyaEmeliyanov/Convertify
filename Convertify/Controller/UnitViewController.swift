//
//  MeasureViewController.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 20/08/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit
import GradientView // importing gradient enabler

import CoreData


class UnitViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navItem: UINavigationItem!
    
    var selectedCollectionViewItemLabel: String?
    var collectionViewItemLabels: [String]?
    
    var units: [Unit]?
    
    let defaults = UserDefaults.standard
    let key = "favorites"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: K.collectionViewCellId)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Setting <favoriteUnits> based on the updated unit names
        K.favoriteUnits = K.Favorites.getFavorites(favoriteUnitLabels: defaults.array(forKey: key) as! [String])
        
        // Configuring the units and the look of the screens based on the screen name
        configStyles()
        configUnits()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
        if navItem.title == K.screenNames[2] { // whenever you're on screen 'Favorites' update units
            units = K.favoriteUnits
        }
        
        collectionView.reloadData() // and DON'T FORGET TO RELOAD ⚠️
    }
    
    
    func configUnits() {
        switch navItem.title {
        case K.screenNames[0]:
            units = K.standardUnits
            break
        case K.screenNames[1]:
            units = K.proUnits
            break
        case K.screenNames[2]:
            units = K.favoriteUnits
            break
        default:
            break
        }
    }
    
}


//MARK: - UICollectionViewDelegate
extension UnitViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        var cards = [Card]()
        for unit in units! {
            cards.append(unit.card)
        }
        
        // setting the label of the collectionViewItem
        selectedCollectionViewItemLabel = cards[indexPath.row].label
        
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
        return units?.count ?? 0    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionViewCellId, for: indexPath) as! MyCollectionViewCell
        
        if let safeUnits = units {
            K.favoriteUnitLabels = defaults.array(forKey: key) as! [String] // setting the transitional favorite unit label array
            
            cell.configure(card: safeUnits[indexPath.row].card)
            cell.card = safeUnits[indexPath.row].card
            cell.isFavorite = K.favoriteUnitLabels.contains(cell.labelView.text!) ? true : false
            
            cell.configFavoriteStyles()
            
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


//MARK: - UnitViewControllerStyles
protocol UnitViewControllerStylesDelegate {
    func configStyles()
    func addGradientToView(x: Int, y: Int, width: Int, height: Int, colors: [UIColor], locations: [CGFloat])
}


extension UnitViewController: UnitViewControllerStylesDelegate {
    
    func addGradientToView(x: Int, y: Int, width: Int, height: Int, colors: [UIColor], locations: [CGFloat]) {
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
    
    func configStyles() {
        var color1 = UIColor(red: 248/255, green: 123/255, blue: 170/255, alpha: 1)
        var color2 = UIColor(red: 185/255, green: 39/255, blue: 94/255, alpha: 0.8)
        
        switch navItem.title {
        case K.screenNames[0]:
            color1 = UIColor(red: 248/255, green: 123/255, blue: 170/255, alpha: 1)
            color2 = UIColor(red: 185/255, green: 39/255, blue: 94/255, alpha: 0.8)
            break
        case K.screenNames[1]:
            color1 = UIColor(red: 45/255, green: 53/255, blue: 227/255, alpha: 0.8)
            color2 = UIColor(red: 192/255, green: 60/255, blue: 238/255, alpha: 1)
            break
        case K.screenNames[2]:
            color1 = UIColor(red: 238/255, green: 60/255, blue: 60/255, alpha: 1)
            color2 = UIColor(red: 248/255, green: 1, blue: 202/255, alpha: 0.8)
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
}
