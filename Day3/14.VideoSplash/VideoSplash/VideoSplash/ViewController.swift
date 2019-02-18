//
//  ViewController.swift
//  VideoSplash
//
//  Created by kuroky on 2019/2/18.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let imageView = UIImageView.init(frame: .zero)
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.top.equalTo(self.view.snp.top).offset(50)
            make.height.equalTo(Double(100))
        }
        imageView.image = UIImage.init(named: "logo")
        
        let loginBtn = UIButton.init(type: .custom)
        self.view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            if #available(iOS 11, *) {
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }
            else {
                make.bottom.equalTo(self.view.snp.bottom)
            }
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)
            make.height.equalTo(Double(40))
        }
        loginBtn.backgroundColor = UIColor.black
        loginBtn.setTitle("LOG IN", for: .normal)
        loginBtn.addTarget(self, action: #selector(clickLogin), for: .touchUpInside)
        
        let signBtn = UIButton.init(type: .custom)
        self.view.addSubview(signBtn)
        signBtn.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.view.snp.trailing)
            if #available(iOS 11, *) {
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }
            else {
                make.bottom.equalTo(self.view.snp.bottom)
            }
            make.width.equalTo(self.view.snp.width).multipliedBy(0.5)
            make.height.equalTo(Double(40))
        }
        signBtn.backgroundColor = UIColor.green
        signBtn.setTitle("SIGN UP", for: .normal)
        signBtn.addTarget(self, action: #selector(clickSign), for: .touchUpInside)
        
        let playerVC = VideoSplashViewController()
        self.addChild(playerVC)
        playerVC.willMove(toParent: self)
        playerVC.view.alpha = 0.8
        self.view.addSubview(playerVC.view)
        self.view.sendSubviewToBack(playerVC.view)
        playerVC.startPlayVideo()
        
    }

    @objc func clickLogin() {
        
    }
    
    @objc func clickSign() {
        
    }
    
}



