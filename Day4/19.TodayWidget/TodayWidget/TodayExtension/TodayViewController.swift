//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by kuroky on 2019/2/20.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    private var currentTime: UILabel!
    private var timer: Timer!
    private var letfTimeWhenQuit: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        let userDefaults = UserDefaults.init(suiteName: "group.todaywidget")
        letfTimeWhenQuit = (userDefaults?.double(forKey: "lefttime"))!
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] (ttt) in
            self?.letfTimeWhenQuit += 0.1
            self?.currentTime.text = String(format: "%.1f", (self?.letfTimeWhenQuit)!)
        })
    }
    
    func setupUI() {
        currentTime = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 30))
        self.view.addSubview(currentTime)
        currentTime.textAlignment = .center
        
        currentTime.text = String(format: "%0.1f", letfTimeWhenQuit)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        currentTime.center = self.view.center
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
