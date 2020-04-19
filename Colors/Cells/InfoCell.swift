//
//  InfoTableViewCell.swift
//  Colors
//
//  Created by Mateus Rodrigues on 17/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.textLabel?.textColor = .label
        self.detailTextLabel?.textColor = .secondaryLabel
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(title: String, content: String?) {
        self.textLabel?.text = title
        self.detailTextLabel?.text = content
    }
    
}

extension InfoCell: NibReusable { }
