//
//  ColorDetailsViewController.swift
//  Colors
//
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

class ColorDetailsViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var color: UIColor
    var style: UIUserInterfaceStyle
    
    init?(coder: NSCoder, color: UIColor, style: UIUserInterfaceStyle) {
        self.color = color
        self.style = style
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.topItem?.title = color.systemColorName
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ColorCell.self)
        tableView.register(InfoCell.self)
    }

}

extension ColorDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Row(indexPath) {
        case .image:
            return tableView.dequeueReusableCell(ofType: ColorCell.self, for: indexPath)
        case .style, .rgba, .hex:
            return tableView.dequeueReusableCell(ofType: InfoCell.self, for: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch Row(indexPath) {
        case .image:
            (cell as! ColorCell).configure(color: color.resolved(for: style))
        case .style:
            (cell as! InfoCell).configure(title: "UIUserInterfaceStyle", content: style.description)
        case .rgba:
            (cell as! InfoCell).configure(title: "RGBa", content: color.resolved(for: style).rgbaString)
        case .hex:
            (cell as! InfoCell).configure(title: "HEX", content: color.resolved(for: style).hexString)
        }
    }
    
    fileprivate enum Row: Int, CaseIterable {
        
        case image
        case style
        case rgba
        case hex
        
        init(_ indexPath: IndexPath) {
            self.init(rawValue: indexPath.row)!
        }
        
    }
    
}
