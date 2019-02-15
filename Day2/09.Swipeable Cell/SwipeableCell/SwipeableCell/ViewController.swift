//
//  ViewController.swift
//  SwipeableCell
//
//  Created by kuroky on 2019/2/15.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let cellId  =   "cellId"
    private var tableView: UITableView!
    private var list: [String] = []
    private var alertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }

    func setupData() {
        let text = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
        let arr = text.components(separatedBy: ",")
        
        for index in arr {
            list.append(index)
        }
    }
    
    func setupUI() {
        tableView = UITableView.init(frame: .zero, style: .plain)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        alertController = UIAlertController.init(title: "", message: "", preferredStyle: .alert)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let action1 = UITableViewRowAction.init(style: .normal, title: "👍") { [weak self] (action, indexPath) in
            self?.showAlert(message: "Thanks for your Love😸")
        }
        
        let action2 = UITableViewRowAction.init(style: .normal, title: "👎") { [weak self] (action, indexPath) in
            self?.showAlert(message: "Tell me why!!!😤")
        }
        
        let action3 = UITableViewRowAction.init(style: .normal, title: "🖖") { [weak self] (action, indexPath) in
            self?.showAlert(message: "What do you mean? 🤔")
        }
        
        return [action3, action2, action1]
    }
    
    func showAlert(message: String) {
        alertController.message = message
        self.present(alertController, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.alertController.dismiss(animated: true, completion: nil)
        }
    }
}

