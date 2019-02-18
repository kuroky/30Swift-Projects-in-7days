//
//  ViewController.swift
//  GradientInTableView
//
//  Created by kuroky on 2019/2/18.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let cellId  =   "cellId"
    private var tableView: UITableView!
    private let rowHeight: CGFloat = 80
    private let colorRatio: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        tableView = UITableView.init(frame: .zero, style: .plain)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = rowHeight
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "when i was young i'd listen to the radio";
        cell.textLabel?.textColor = UIColor.white
        
        var bgView = cell.contentView.viewWithTag(101)
        if bgView == nil {
            bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: rowHeight))
            cell.contentView.addSubview(bgView!)
            bgView!.tag = 101
            cell.contentView.sendSubviewToBack(bgView!)
        }
        
        if let layers = bgView?.layer.sublayers {
            for layer in layers {
                if layer.isKind(of: CAGradientLayer.self) {
                    layer.removeFromSuperlayer()
                }
            }
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bgView!.frame
        let lowerColor:CGColor = UIColor(red: 1.0, green: (CGFloat(indexPath.row * 2) * colorRatio)/255.0, blue: (CGFloat(indexPath.row * 2) * colorRatio)/255.0, alpha: 1).cgColor
        let upperColor:CGColor = UIColor(red: 1.0, green: (CGFloat(indexPath.row * 2) * colorRatio + colorRatio)/255.0, blue: (CGFloat(indexPath.row * 2) * colorRatio + colorRatio)/255.0, alpha: 1).cgColor
        gradientLayer.colors = [lowerColor, upperColor]
        bgView?.layer.addSublayer(gradientLayer)
        
        return cell
    }
}

