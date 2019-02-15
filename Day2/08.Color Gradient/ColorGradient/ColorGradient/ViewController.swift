//
//  ViewController.swift
//  ColorGradient
//
//  Created by kuroky on 2019/2/15.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var colorLayer: CAGradientLayer!
    private var timeLabel: UILabel!
    private var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }

    func setupData() {
        let gesture = UIPanGestureRecognizer.init()
        gesture.addTarget(self, action: #selector(panGesture(pan:)))
        self.view.addGestureRecognizer(gesture)
    }
    
    func setupUI() {
        colorLayer = CAGradientLayer.init()
        colorLayer.frame = self.view.bounds
        colorLayer.colors = [UIColor.white.cgColor, UIColor.lightGray.cgColor]
        self.view.layer.addSublayer(colorLayer)
        
        timeLabel = UILabel.init(frame: CGRect.init(x: 20, y: 100, width: 100, height: 20))
        timeLabel.font = UIFont.systemFont(ofSize: 16)
        timeLabel.textColor = UIColor.white
        timeLabel.text = "0:0"
        timeLabel.textAlignment = .center
        self.view.addSubview(timeLabel)
        
        temperatureLabel = UILabel.init(frame: CGRect.init(x: 200, y: 100, width: 100, height: 20))
        temperatureLabel.font = UIFont.systemFont(ofSize: 16)
        temperatureLabel.textColor = UIColor.white
        temperatureLabel.text = "18"
        temperatureLabel.textAlignment = .center
        self.view.addSubview(temperatureLabel)
    }

    
    @objc func panGesture(pan: UIPanGestureRecognizer) {
        
    }
}

