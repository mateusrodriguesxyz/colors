//
//  ColorDetailsTableViewCell.swift
//  Colors
//
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

class ColorCell: UITableViewCell {

    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.layer.cornerRadius = 10
        colorView.layer.borderWidth = 1
        colorView.layer.borderColor = UIColor.label.withAlphaComponent(0.1).cgColor
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        colorView.layer.borderColor = UIColor.label.withAlphaComponent(0.1).cgColor
    }
    
    func configure(color: UIColor) {
        colorView.backgroundColor = color
    }
    
}

extension ColorCell: NibReusable { }
