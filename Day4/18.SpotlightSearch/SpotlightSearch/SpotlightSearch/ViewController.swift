//
//  ViewController.swift
//  SpotlightSearch
//
//  Created by kuroky on 2019/2/19.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import CoreSpotlight

class ViewController: UIViewController {

    private let cellId = "cellId"
    private var tableView: UITableView!
    let dataSource = [
        ["name":"Dangal","cover":"Absurd Accident","description":"This is a warm and humorous inspirational story.","ranking":8.6],
        ["name":"Guardians of the Galaxy","cover":"roasterDad","description":"The Galactic guards cross the universe in this focus.","ranking":7.9],
        ["name":"Absurd Accident","cover":"GuardingStar","description":"Northeast, Yang million and his wife Ma Lilian runs 'Cyclamen hotel'","ranking":7.0]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        let notificationName = NSNotification.Name.init("receivedIdFromSpotlightSearch")
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNoti(noti:)), name: notificationName, object: nil)
        
        CSSearchableIndex.default().deleteAllSearchableItems { (error) in
            print("delete all")
        }
    }
    
    func setupUI() {
        tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        self.view.addSubview(tableView)
        tableView.rowHeight = 60
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc func didReceiveNoti(noti: NSNotification) {
        let userInfo = noti.userInfo
        let index = Int(userInfo?["id"] as! String)
        
        let item = dataSource[index!]
        let detail = DetailViewController()
        detail.item = item
        self.navigationController?.pushViewController(detail, animated: true)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let item: [String: Any] = dataSource[indexPath.row]
        cell.textLabel?.text = item["name"] as? String
        
        let attributSet = CSSearchableItemAttributeSet(itemContentType: "test")
        attributSet.title = item["name"] as? String
        attributSet.contentDescription = item["description"] as? String
        
        let imgName = item["cover"] as? String
        let image = UIImage(named: imgName!)?.pngData()
        attributSet.thumbnailData = image
        
        let searchItem = CSSearchableItem(uniqueIdentifier: "\(indexPath.row)", domainIdentifier: "nimomeng", attributeSet: attributSet)
        let tmpItems = [searchItem]
        CSSearchableIndex.default().indexSearchableItems(tmpItems) { (error) in
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = dataSource[indexPath.row]
        
        let detail = DetailViewController()
        detail.item = item
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

