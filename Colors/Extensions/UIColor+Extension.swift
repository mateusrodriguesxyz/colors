//
//  UIColor+Extension.swift
//  Colors
//
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

extension UIColor {

    static var dynamicColors: [UIColor] = [
        .systemRed,
        .systemGreen,
        .systemBlue,
        .systemIndigo,
        .systemOrange,
        .systemPink,
        .systemPurple,
        .systemTeal,
        .systemYellow,
        .label,
        .secondaryLabel,
        .tertiaryLabel,
        .quaternaryLabel,
        .systemFill,
        .secondarySystemFill,
        .tertiarySystemFill,
        .quaternarySystemFill,
        .placeholderText,
        .systemBackground,
        .secondarySystemBackground,
        .tertiarySystemBackground,
        .systemGroupedBackground,
        .secondarySystemGroupedBackground,
        .tertiarySystemGroupedBackground,
        .separator,
        .opaqueSeparator,
        .link,
        .darkText,
        .lightText
    ]
    
    var systemColorName: String? {
        self.value(forKey: "systemColorName") as? String
    }
    
    var rgbaString: String? {
        let components = self.components
        let red = Int(components.red * 255)
        let green = Int(components.green * 255)
        let blue = Int(components.blue * 255)
        let alpha = Float(components.alpha)
        return String(format: "(%d, %d, %d, %.2f)", red, green, blue, alpha)
    }
    
    var hexString: String? {
        let components = self.components
        let red = Int(components.red * 255)
        let green = Int(components.green * 255)
        let blue = Int(components.blue * 255)
        let alpha = Int(components.alpha * 255)
        return String(format: "#%02x%02x%02x%02x", red, green, blue, alpha)
    }
    
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
    
    var contrastColor: UIColor {
        var luma: CGFloat = 0
        var alpha: CGFloat = 0
        getWhite(&luma, alpha: &alpha)
        if alpha < 0.6 {
            if UITraitCollection.current.userInterfaceStyle == .light {
                return UIColor.black
            } else {
                return UIColor.white
            }
        } else {
            return luma > 0.5 ? .black : .white
        }
    }
    
    func resolved(for style: UIUserInterfaceStyle) -> UIColor {
        self.resolvedColor(with: UITraitCollection(userInterfaceStyle: style))
    }
    
}
