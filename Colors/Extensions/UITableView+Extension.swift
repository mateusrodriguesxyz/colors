//
//  UITableView+Extension.swift
//  Colors
//
//  Created by Mateus Rodrigues on 18/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: NibReusable>(_: T.Type) {
        self.register(T.nib, forCellReuseIdentifier: T.identifier)
    }
    func dequeueReusableCell<T: NibReusable>(ofType: T.Type, for indexPath: IndexPath) -> T {
        self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}
