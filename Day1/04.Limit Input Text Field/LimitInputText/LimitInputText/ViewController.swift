//
//  ViewController.swift
//  LimitInputText
//
//  Created by kuroky on 2019/2/14.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let maxCount = 50
    private var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        self.navigationItem.title = "Text"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "close", style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "send", style: .plain, target: self, action: nil)
        
        let imageView = UIImageView.init(frame: .zero)
        imageView.image = UIImage.init(named: "avatar")
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading).offset(10)
            if #available(iOS 11, *) {
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            }
            else {
                make.top.equalTo(self.view.snp.top).offset(10)
            }
            make.width.equalTo(Double(72))
            make.height.equalTo(Double(72))
        }
        
        let textView = UITextView.init(frame: .zero)
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.tintColor = UIColor.lightGray
        self.view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            if #available(iOS 11, *) {
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            }
            else {
                make.top.equalTo(self.view.snp.top).offset(10)
            }
            make.trailing.equalTo(self.view.snp.trailing).offset(10)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.height.equalTo(200)
        }
        
        countLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 30))
        countLabel.text = "\(maxCount)"
        countLabel.textAlignment = .right
        textView.inputAccessoryView = countLabel
    }
}

extension ViewController: UITextViewDelegate {
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (textView.text.count + text.count) > maxCount {
            countLabel.text = "0"
            return false
        }
        let count = (maxCount - textView.text.count)
        countLabel.text = "\(count)"
        return true
    }
    
}
