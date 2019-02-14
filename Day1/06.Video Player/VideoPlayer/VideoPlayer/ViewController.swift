//
//  ViewController.swift
//  VideoPlayer
//
//  Created by kuroky on 2019/2/14.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import AVKit

class ViewController: UIViewController {

    private var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        do {
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .interruptSpokenAudioAndMixWithOthers)
        }
        catch {
            
        }
    }

    func setupUI() {
        let button1 = UIButton.init(type: .custom)
        button1.backgroundColor = UIColor.lightGray
        button1.frame = CGRect.init(x: 120, y: 60, width: 150, height: 40)
        button1.setTitle("Video", for: .normal)
        button1.addTarget(self, action: #selector(clickVideoButton), for: .touchUpInside)
        self.view.addSubview(button1)
        
        let button2 = UIButton.init(type: .custom)
        button2.backgroundColor = UIColor.lightGray
        button2.frame = CGRect.init(x: 120, y: 200, width: 150, height: 40)
        button2.setTitle("Audio Play", for: .normal)
        button2.addTarget(self, action: #selector(clickAudioButton), for: .touchUpInside)
        self.view.addSubview(button2)
        
        let button3 = UIButton.init(type: .custom)
        button3.backgroundColor = UIColor.lightGray
        button3.frame = CGRect.init(x: 120, y: 340, width: 150, height: 40)
        button3.setTitle("Audio Pause", for: .normal)
        button3.addTarget(self, action: #selector(clickAudioPause), for: .touchUpInside)
        self.view.addSubview(button3)
    }
    
    @objc func clickVideoButton() {
        guard let path = Bundle.main.path(forResource: "Shapeofyou", ofType: "mp4") else { return }
        
        let url = URL(fileURLWithPath: path)
        let player = AVPlayer.init(url: url)
        
        
        let playVC = AVPlayerViewController.init()
        playVC.player = player
        self.present(playVC, animated: true, completion: nil)
    }
    
    @objc func clickAudioButton() {
        guard let path = Bundle.main.path(forResource: "live", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
    
        if audioPlayer != nil {
            audioPlayer.play()
            return;
        }
        
        guard let audio = try? AVAudioPlayer.init(contentsOf: url) else {
            return
        }
        
        audioPlayer = audio
        audioPlayer.play()
    }
    
    @objc func clickAudioPause() {
        if audioPlayer != nil {
            audioPlayer.pause()
        }
    }
}

