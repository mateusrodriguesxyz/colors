//
//  UIUserInterfaceStyle+Extension.swift
//  Colors
//
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

extension UIUserInterfaceStyle {
    var description: String {
        switch self {
        case .dark:
            return ".dark"
        case .light:
            return ".light"
        case .unspecified:
            return ".unspecifed"
        @unknown default:
            fatalError()
        }
    }
}
