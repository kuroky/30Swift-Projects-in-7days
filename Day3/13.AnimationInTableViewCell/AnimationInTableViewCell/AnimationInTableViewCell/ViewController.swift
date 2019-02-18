//
//  ViewController.swift
//  AnimationInTableViewCell
//
//  Created by kuroky on 2019/2/18.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let cellId  =   "cellId"
    private var tableView: UITableView!
    private let colorRatio: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tblHeight = tableView.frame.height
        
        for (index, cell) in cells.enumerated() {
            
            cell.frame.origin.y = tblHeight
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                //                cell.transform = CGAffineTransform(translationX: 0, y: 0);
                cell.frame.origin.y = 0
            }, completion: nil)
            
        }
        */
        tableView.layoutIfNeeded()
    }

    func setupUI() {
        tableView = UITableView.init(frame: .zero, style: .plain)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        tableView.rowHeight = 60
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "when i was young i'd listen to the radio"
        cell.textLabel?.textColor = UIColor.white
        _ = viewForTag(tag: 101, from: cell, indexPath: indexPath)
        return cell
    }
    
    func viewForTag(tag: Int, from cell: UITableViewCell, indexPath: IndexPath) -> UIView? {
        var bgView = cell.contentView.viewWithTag(tag)
        if bgView == nil {
            bgView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 60))
            cell.contentView.addSubview(bgView!)
            cell.contentView.sendSubviewToBack(bgView!)
            bgView!.tag = tag
        }
        
        if let layers = bgView?.layer.sublayers {
            for layer in layers {
                if layer.isKind(of: CAGradientLayer.self) {
                    layer.removeFromSuperlayer()
                }
            }
        }
        
        let lowerColor:CGColor = UIColor(red: 1.0, green: (CGFloat(indexPath.row * 2) * colorRatio)/255.0, blue: (CGFloat(indexPath.row * 2) * colorRatio)/255.0, alpha: 1).cgColor
        let upperColor:CGColor = UIColor(red: 1.0, green: (CGFloat(indexPath.row * 2) * colorRatio + colorRatio)/255.0, blue: (CGFloat(indexPath.row * 2) * colorRatio + colorRatio)/255.0, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.frame = bgView!.frame
        gradientLayer.colors = [lowerColor, upperColor]
        bgView?.layer.addSublayer(gradientLayer)
        
        return bgView
    }
    
}
