//
//  ColorTableViewCell.swift
//  Colors
//
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

protocol ColorTableViewCellDelegate: UIViewController, UIContextMenuInteractionDelegate {
    func didSelect(cell: UITableViewCell, with style: UIUserInterfaceStyle)
}

class DynamicCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lightView: UIView!
    @IBOutlet weak var darkView: UIView!
    
    @IBOutlet weak var lightImageView: UIImageView!
    @IBOutlet weak var darkImageView: UIImageView!
    
    weak var delegate: ColorTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lightView.layer.borderColor = UIColor.label.withAlphaComponent(0.1).cgColor
        lightView.overrideUserInterfaceStyle = .light
        lightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onColorTapped(_:))))
        
        darkView.layer.borderColor = UIColor.label.withAlphaComponent(0.1).cgColor
        darkView.overrideUserInterfaceStyle = .dark
        darkView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onColorTapped(_:))))
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        lightView.layer.borderColor = UIColor.label.withAlphaComponent(0.1).cgColor
        darkView.layer.borderColor = UIColor.label.withAlphaComponent(0.1).cgColor
    }
    
    public func configure(with color: UIColor, delegate: ColorTableViewCellDelegate) {
        
        self.delegate = delegate
        
        self.nameLabel.text = color.systemColorName
        self.lightView.backgroundColor = color
        self.darkView.backgroundColor = color
        
        lightImageView.tintColor = color.resolved(for: .light).contrastColor
        darkImageView.tintColor = color.resolved(for: .dark).contrastColor
        
        if let controller = self.delegate {
            lightView.addInteraction(UIContextMenuInteraction(delegate: controller))
            darkView.addInteraction(UIContextMenuInteraction(delegate: controller))
        }
        
    }
    
    @objc func onColorTapped(_ sender: UITapGestureRecognizer) {
        if let view = sender.view {
            delegate?.didSelect(cell: self, with: view.overrideUserInterfaceStyle)
        }
    }
    
}

extension DynamicCell: NibReusable { }




