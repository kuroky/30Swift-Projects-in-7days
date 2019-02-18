//
//  ViewController.swift
//  TumblrMenu
//
//  Created by kuroky on 2019/2/18.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var blurView: UIVisualEffectView!
    
    private var alphaBtn: UIButton!
    private var quoteBtn: UIButton!
    private var chatBtn: UIButton!
    private var photoBtn: UIButton!
    private var linkBtn: UIButton!
    private var audioBtn: UIButton!
    private let dumpingRate:CGFloat = 0.7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()        
    }

    func setupUI() {
        let bgImageView = UIImageView(frame: self.view.frame)
        bgImageView.image = UIImage.init(named: "LaunchImage-800")
        bgImageView.isUserInteractionEnabled = true
        self.view.addSubview(bgImageView)
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(didTapGesture))
        bgImageView.addGestureRecognizer(tapGesture)
        
        setupEfectView()
    }
    
    func setupEfectView() {
        let blurEffect = UIBlurEffect.init(style: .dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view.addSubview(blurView)
        blurView.alpha = 0
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(removeBlur))
        blurView.addGestureRecognizer(tapGes)
        
        alphaBtn = UIButton.init(frame: CGRect.init(x: -88, y: 80, width: 88, height: 88))
        alphaBtn.setImageAndTitle(image: "alpha", title: "Message", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(alphaBtn)
        
        quoteBtn = UIButton.init(frame: CGRect.init(x: -88, y: 80 + 166, width: 88, height: 88))
        quoteBtn.setImageAndTitle(image: "Quote", title: "Quote", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(quoteBtn)
        
        chatBtn = UIButton.init(frame: CGRect.init(x: -88, y: 80 + 166 + 166, width: 88, height: 88))
        chatBtn.setImageAndTitle(image: "Chat", title: "Chat", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(chatBtn)
        
        photoBtn = UIButton.init(frame: CGRect.init(x: self.view.frame.width + 88, y: 80, width: 88, height: 88))
        photoBtn.setImageAndTitle(image: "Photo", title: "Photo", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(photoBtn)
        
        linkBtn = UIButton.init(frame: CGRect.init(x: self.view.frame.width + 88, y: 80 + 166, width: 88, height: 88))
        linkBtn.setImageAndTitle(image: "Link", title: "Link", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(linkBtn)
        
        audioBtn = UIButton.init(frame: CGRect.init(x: self.view.frame.width + 88, y: 80 + 166 + 166, width: 88, height: 88))
        audioBtn.setImageAndTitle(image: "Audio", title: "Audio", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(audioBtn)
    }

    @objc func didTapGesture() {
        
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 1
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            self.alphaBtn.frame.origin.x = 60
            self.photoBtn.frame.origin.x = self.alphaBtn.frame.maxX + 100
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            self.quoteBtn.frame.origin.x = 60
            self.linkBtn.frame.origin.x = self.quoteBtn.frame.maxX + 100
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            self.chatBtn.frame.origin.x = 60
            self.audioBtn.frame.origin.x = self.chatBtn.frame.maxX + 100
        }, completion: nil)
    }
    
    @objc func removeBlur() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 1, options: .allowAnimatedContent, animations: {
            self.blurView.alpha = 0
            self.alphaBtn.frame.origin.x = -88
            self.quoteBtn.frame.origin.x = -88
            self.chatBtn.frame.origin.x = -88
            self.photoBtn.frame.origin.x = self.view.frame.maxX + 88
            self.linkBtn.frame.origin.x = self.view.frame.maxX + 88
            self.audioBtn.frame.origin.x = self.view.frame.maxX + 88
        }, completion: nil)
    }
}

