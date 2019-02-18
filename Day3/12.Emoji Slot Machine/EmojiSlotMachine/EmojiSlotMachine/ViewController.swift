//
//  ViewController.swift
//  EmojiSlotMachine
//
//  Created by kuroky on 2019/2/18.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var pickView: UIPickerView!
    private let emojiArray = ["😀","😎","😈","👻","🙈","🐶","🌚","🍎","🎾","🐥","🐔"]
    private var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        pickView = UIPickerView.init(frame: .zero)
        self.view.addSubview(pickView)
        pickView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
            make.top.equalTo(self.view.snp.top).offset(200)
            make.height.equalTo(Double(200))
        }
        pickView.delegate = self
        pickView.dataSource = self
        
        let button = UIButton.init(type: .custom)
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(pickView.snp.centerX)
            make.top.equalTo(pickView.snp.bottom).offset(30)
            make.width.equalTo(Double(120))
            make.height.equalTo(Double(40))
        }
        button.setTitle("Go", for: .normal)
        button.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        button.backgroundColor = UIColor.lightGray
        
        label = UILabel.init(frame: .zero)
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerX.equalTo(button.snp.centerX)
            make.top.equalTo(button.snp.bottom).offset(30)
            make.width.equalTo(Double(100))
            make.height.equalTo(Double(30))
        }
    }
    
    @objc func clickAction() {
        let random1 = Int(arc4random() % UInt32(emojiArray.count))
        let random2 = Int(arc4random() % UInt32(emojiArray.count))
        let random3 = Int(arc4random() % UInt32(emojiArray.count))
        
        pickView.selectRow(random1, inComponent: 0, animated: true)
        pickView.selectRow(random2, inComponent: 1, animated: true)
        pickView.selectRow(random3, inComponent: 2, animated: true)
        
        if random1 == random2 && random1 == random3 {
            label.text = "👏👏👏"
        }
        else {
            label.text = "💔💔💔"
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emojiArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel.init()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40)
        label.text = emojiArray[row]
        return label
    }
}

