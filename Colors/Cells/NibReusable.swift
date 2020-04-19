//
//  NibReusable.swift
//  Colors
//
//  Created by Mateus Rodrigues on 18/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

protocol NibReusable: UITableViewCell {
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension NibReusable {
    static var identifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}
