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
    
    @IBOutlet weak var itemView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    
    var card: Card?
    var isFavorite: Bool = false
    
    let defaults = UserDefaults.standard
    let key = "favorites"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 15.0

        setupBackgroundBlur()
    }
    
    
    public func configure(card: Card) {
        // Configuring card appearence
        imageView.image = card.image
        labelView.text = card.label
        labelView.textColor = card.labelColor
        
    }
    
    public func configFavoriteStyles() {
        if isFavorite {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor =  UIColor(named: "IsLikedColor")
        } else {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .white
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: K.collectionViewCellId, bundle: nil)
    }
    
    private func setupBackgroundBlur() {
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectVIew = UIVisualEffectView(effect: blurEffect)
        visualEffectVIew.alpha = 0.2
        visualEffectVIew.frame = itemView.bounds
        itemView.addSubview(visualEffectVIew)
    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        isFavorite = !isFavorite
        
        K.Favorites.setFavorites(labelView: labelView, isFavorite: isFavorite) // setting K.favoriteUnitLabels
        configFavoriteStyles()
        K.favoriteUnits = K.Favorites.getFavorites(favoriteUnitLabels: K.favoriteUnitLabels)
        defaults.set(K.favoriteUnitLabels, forKey: key)
        
        print(K.favoriteUnitLabels)
    }
    
    
}
