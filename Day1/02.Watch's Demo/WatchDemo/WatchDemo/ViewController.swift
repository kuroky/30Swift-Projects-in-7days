//
//  ViewController.swift
//  WatchDemo
//
//  Created by kuroky on 2019/2/14.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var topView: UIView!
    private var countLabel: UILabel!
    private var timer: Timer!
    private var count: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        topView = UIView.init(frame: .zero)
        topView.backgroundColor = UIColor.init(red: 224/255.0, green: 203/255.0, blue: 182/255.0, alpha: 1.0)
        self.view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.top.equalTo(self.view.snp.top)
            make.height.equalTo(self.view.snp.height).multipliedBy(0.5)
        }
        
        countLabel = UILabel.init(frame: .zero)
        countLabel.textAlignment = .center
        countLabel.textColor = UIColor.black
        countLabel.text = "\(count)"
        countLabel.font = UIFont.systemFont(ofSize: 20)
        topView.addSubview(countLabel)
        countLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(topView.snp.centerX)
            make.centerY.equalTo(topView.snp.centerY)
        }
        
        let resetButton = UIButton.init(type: .custom)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(UIColor.white, for: .normal)
        resetButton.addTarget(self, action: #selector(clickResetButton), for: .touchUpInside)
        topView.addSubview(resetButton)
        resetButton.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.top).offset(40)
            make.trailing.equalTo(topView.snp.trailing).offset(-30)
            make.width.equalTo(Double(60))
            make.height.equalTo(Double(40))
        }
        
        let bottomLeftBtn = UIButton.init(type: .custom)
        bottomLeftBtn.addTarget(self, action: #selector(clickStartButton), for: .touchUpInside)
        bottomLeftBtn.setTitle("Start", for: .normal)
        bottomLeftBtn.backgroundColor = UIColor.init(red: 1.0, green: 101/255.0, blue: 27/255.0, alpha: 1.0)
        self.view.addSubview(bottomLeftBtn)
        bottomLeftBtn.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        let bottomRightBtn = UIButton.init(type: .custom)
        bottomRightBtn.addTarget(self, action: #selector(clickEndButton), for: .touchUpInside)
        bottomRightBtn.setTitle("End", for: .normal)
        bottomRightBtn.backgroundColor = UIColor.init(red: 98/255.0, green: 242/255.0, blue: 23/255.0, alpha: 1.0)
        self.view.addSubview(bottomRightBtn)
        bottomRightBtn.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom)
            make.trailing.equalTo(self.view.snp.trailing)
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }
    
    @objc func clickResetButton() {
        if timer == nil {
            return
        }
        timer.invalidate()
        timer = nil
        self.count = 0.0
        countLabel.text = "\(self.count)"
    }
    
    @objc func clickStartButton() {
        if timer != nil {
            return
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.count = strongSelf.count + 0.1
            strongSelf.countLabel.text = String.init(format: "%.1f", strongSelf.count)
        })
    }
    
    @objc func clickEndButton() {
        if timer == nil {
            return
        }
        timer.invalidate()
        timer = nil
    }
}

