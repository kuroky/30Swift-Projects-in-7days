//
//  ViewController.swift
//  LoginAnimation
//
//  Created by kuroky on 2019/2/19.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var contentView: UIView!
    private var usernameTF: UITextField!
    private var passwordTF: UITextField!
    private var logButton: UIButton!
    
    private var imageView: UIImageView!
    private var btn1: UIButton!
    private var btn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        doAnimationn()
    }

    func setupUI() {
        self.view.backgroundColor = UIColor.green
        
        contentView = UIView.init(frame: self.view.bounds)
        self.view.addSubview(contentView)
        contentView.backgroundColor = UIColor.green
        
        imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 20, width: contentView.frame.width, height: 100))
        imageView.image = UIImage.init(named: "logo")
        contentView.addSubview(imageView)
        
        btn1 = UIButton.init(type: .custom)
        btn1.frame = CGRect.init(x: 0, y: contentView.frame.height - 40, width: contentView.frame.width * 0.5, height: 40)
        contentView.addSubview(btn1)
        btn1.backgroundColor = UIColor.black
        btn1.setTitle("LOG IN", for: .normal)
        
        btn2 = UIButton.init(type: .custom)
        btn2.frame = CGRect.init(x: self.view.frame.width * 0.5, y: self.view.frame.height - 40, width: self.view.frame.width * 0.5, height: 40)
        contentView.addSubview(btn2)
        btn2.backgroundColor = UIColor.lightGray
        btn2.setTitle("SIGN UP", for: .normal)
        
        let tfWidth: CGFloat = self.view.frame.width - 60
        let tfHeight: CGFloat = 40
        usernameTF = UITextField.init(frame: CGRect.init(x: -self.view.frame.width, y: 40, width: tfWidth, height: tfHeight))
        self.view.addSubview(usernameTF)
        usernameTF.placeholder = "userName"
        usernameTF.backgroundColor = UIColor.white
        
        passwordTF = UITextField.init(frame: CGRect.init(x: -self.view.frame.width, y: usernameTF.frame.maxY + 20, width: tfWidth, height: tfHeight))
        self.view.addSubview(passwordTF)
        passwordTF.placeholder = "password"
        passwordTF.backgroundColor = UIColor.white
        
        logButton = UIButton.init(type: .custom)
        logButton.frame = CGRect.init(x: -self.view.frame.width, y: passwordTF.frame.maxY + 40, width: 100, height: 40)
        self.view.addSubview(logButton)
        logButton.backgroundColor = UIColor.white
    }
    
    func doAnimationn() {
        UIView.animate(withDuration: 0.3, delay: 0.6, options: .curveEaseInOut, animations: { [weak self] in
            self?.contentView.alpha = 0.0
        }) { [weak self] (finish) in
            self?.contentView.isHidden = true
        }
        
        UIView.animate(withDuration: 0.3, delay: 1.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: .curveEaseIn, animations: { [weak self] in
            self?.usernameTF.center.x = (self?.view.center.x)!
            self?.passwordTF.center.x = (self?.view.center.x)!
        })
        
        UIView.animate(withDuration: 0.3, delay: 1.5, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: .curveLinear, animations: { [weak self] in
            self?.logButton.center.x = (self?.view.center.x)!
        }) { [weak self] (finish) in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: { [weak self] in
                self?.logButton.frame.size.width = 180
                self?.logButton.center.x = (self?.view.center.x)!
                }, completion: { (finish) in
                    
            })
        }
    }

}

