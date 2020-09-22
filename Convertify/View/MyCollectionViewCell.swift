//
//  MyCollectionViewCell.swift
//  Measure Converter
//
//  Created by Ilya Emeliyanov on 20/08/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit
import VisualEffectView

class MyCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 15.0
        
//        setupBackgroundBlur()
    }
    
    
    public func configure(card: Card) {
        // Configuring card appearence
        imageView.image = card.image
        labelView.text = card.label
    }
    
    static func nib() -> UINib {
        return UINib(nibName: K.collectionViewCellId, bundle: nil)
    }
    
    private func setupBackgroundBlur() {
//        let overlayColor = UIColor().fromHexToUIColor("4E4676")
//        let visualEffectView = VisualEffectView(frame: self.bounds)
//
//        // Configure the view with tint color, blur radius, etc
//        visualEffectView.colorTint = overlayColor
//        visualEffectView.colorTintAlpha = 0.8
//        visualEffectView.blurRadius = 5
        
//        This option is obsolete => iOS 14 does the insertionSubview auomatically
//        self.insertSubview(visualEffectView, at: 0)
    }
    
}
