//
//  UIAction+Extension.swift
//  Colors
//
//  Created by Mateus Rodrigues on 17/04/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

extension UIAction {
    
    static func info(content: String) -> UIAction {
        UIAction(title: content, image: nil) { _ in }
    }
    
    static func pasteboard(content: String, message: String, controller: UIViewController) -> UIAction {
        UIAction(title: content, image: UIImage(systemName: "doc.on.doc")) { action in
            UIPasteboard.general.string = content
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
            if let popover = alert.popoverPresentationController {
                popover.sourceView = controller.view
                popover.sourceRect = CGRect(x: controller.view.bounds.midX, y: controller.view.bounds.maxY, width: 0, height: 0)
                popover.permittedArrowDirections = []
            }
            controller.present(alert, animated: true) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    alert.dismiss(animated: true)
                }
            }
        }
    }
    
}
