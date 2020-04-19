//
//  ViewController.swift
//  Colors
//
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

class ColorsViewController: UITableViewController {
    
    let colors = UIColor.dynamicColors
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.contentInset.top = 10
        tableView.contentInset.bottom = 10
        tableView.register(DynamicCell.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colors[indexPath.row]
        let cell = tableView.dequeueReusableCell(ofType: DynamicCell.self, for: indexPath)
        cell.configure(with: color, delegate: self)
        return cell
    }
    
    @IBSegueAction func details(coder: NSCoder, sender: Any?, segueIdentifier: String?) -> ColorDetailsViewController? {
        let (color, style) = sender as! (UIColor, UIUserInterfaceStyle)
        return ColorDetailsViewController(coder: coder, color: color, style: style)
    }

}

extension ColorsViewController: ColorTableViewCellDelegate {
    
    func didSelect(cell: UITableViewCell, with style: UIUserInterfaceStyle) {
        if let indexPath = tableView.indexPath(for: cell) {
            let color = colors[indexPath.row]
            performSegue(withIdentifier: "details", sender: (color, style))
        }
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {

        let view = interaction.view!
        
        guard let indexPath = tableView.indexPathForRow(at: view.convert(location, to: tableView)) else { return nil }
        
        let style = view.overrideUserInterfaceStyle
        let color = colors[indexPath.row].resolved(for: style)
        
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            UIMenu(title: "", children: [
                UIAction.info(content: style.description),
                UIAction.pasteboard(content: color.rgbaString!, message: "RGBa value copied to clipboard", controller: self),
                UIAction.pasteboard(content: color.hexString!, message: "HEX value copied to clipboard", controller: self)
            ])
        }
        
        return configuration
    }
    
}

