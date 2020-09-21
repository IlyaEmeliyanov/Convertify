//
//  MyTableViewCell.swift
//  Unit Converter
//
//  Created by Ilya Emeliyanov on 12/09/2020.
//  Copyright © 2020 Ilya Emeliyanov. All rights reserved.
//

import UIKit
import VisualEffectView

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var labelView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor.clear.withAlphaComponent(0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(labelViewText: String) {
        labelView.text = labelViewText
    }
    
    static func nib() -> UINib {
        return UINib(nibName: K.tableViewCellId, bundle: nil)
    }
    
//    private func setupBackgroundBlur() {
//        let overlayColor = UIColor().fromHexToUIColor("415285")
//           let visualEffectView = VisualEffectView(frame: self.bounds)
//
//           // Configure the view with tint color, blur radius, etc
//           visualEffectView.colorTint = overlayColor
//           visualEffectView.colorTintAlpha = 0.1
//           visualEffectView.blurRadius = 3
//
//
////        This option is obsolete => iOS 14 does the insertionSubview auomatically
//           self.insertSubview(visualEffectView, at: 0)
//       }
    
}
