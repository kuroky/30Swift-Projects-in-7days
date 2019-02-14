//
//  ViewController.swift
//  CustomFont
//
//  Created by kuroky on 2019/2/14.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var textlabel: UILabel = {
        let label = UILabel.init(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.textAlignment = .center
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
            make.top.equalTo(self.view.snp.top).offset(200)
            make.height.equalTo(Double(30))
        }
        return label
    }()
    
    private lazy var fontLabel: UILabel = {
        let label = UILabel.init(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
            make.top.equalTo(self.textlabel.snp.bottom).offset(10)
            make.height.equalTo(Double(20))
        }
        return label
    }()
    
    private lazy var clickBtn: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 4.0
        button.addTarget(self, action: #selector(clickFontButton), for: .touchUpInside)
        self.view.addSubview(button)
        button.snp.makeConstraints({ (make) in
            make.leading.equalTo(self.view.snp.leading).offset(80)
            make.trailing.equalTo(self.view.snp.trailing).offset(-80)
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
            make.height.equalTo(Double(40))
        })
        return button
    }()
    
    let familyNames: [String] = UIFont.familyNames
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textlabel.text = "I am the king of the world"
        clickBtn.setTitle("RandomFont", for: .normal)
        fontLabel.text = "FontName: Default"
    }
    
    @objc func clickFontButton() {
        let index = Int(arc4random() % UInt32(familyNames.count))
        print(index)
        let fontName = familyNames[index]
        fontLabel.text = "FontName: " + fontName
        textlabel.font = UIFont.init(name: fontName, size: 20)
    }
}

