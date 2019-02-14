//
//  ViewController.swift
//  Refresh
//
//  Created by kuroky on 2019/2/14.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var tableView: UITableView!
    private var refresh: UIRefreshControl!
    private var list: [String]!
    private var formatter: DateFormatter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        formatter = DateFormatter.init()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let dates = formatter.string(from: Date())
        list = [dates]
    }

    func setupUI() {
        tableView = UITableView.init(frame: .zero, style: .plain)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.snp.edges)
        }
        tableView.rowHeight = 50
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        refresh = UIRefreshControl.init(frame: .zero)
        refresh.attributedTitle = NSAttributedString(string: "refresh")
        refresh.addTarget(self, action: #selector(pullRefresh), for: .valueChanged)
        tableView.addSubview(refresh)
    }

    @objc func pullRefresh() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            if let strongSelf = self {
                strongSelf.refresh.endRefreshing()
                let dates = strongSelf.formatter.string(from: Date())
                strongSelf.list.insert(dates, at: 0)
                strongSelf.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
}
