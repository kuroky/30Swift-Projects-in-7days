//
//  ViewController.swift
//  StretchyHeader
//
//  Created by kuroky on 2019/2/15.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let cellId  =   "cellId"
    private var tableView: UITableView!
    private var imageView: UIImageView!
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
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
        
        imageView = UIImageView.init(image: UIImage.init(named: "banner"))
        imageView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        //tableView.addSubview(imageView)
        tableView.tableHeaderView = imageView
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "text"
        return cell
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let maxOffsetY = tableView.frame.height
        if maxOffsetY == 0 {
            return
        }
        let offsetY = scrollView.contentOffset.y
        let validateOffsetY = -offsetY / maxOffsetY
        let scaleFactor = 1 + validateOffsetY
        imageView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
    }
}
