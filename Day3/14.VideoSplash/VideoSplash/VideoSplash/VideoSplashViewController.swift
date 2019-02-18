//
//  VideoSplashViewController.swift
//  VideoSplash
//
//  Created by kuroky on 2019/2/18.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class VideoSplashViewController: UIViewController {

    private let moviePlayer = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        guard let path = Bundle.main.path(forResource: "moments", ofType: "mp4") else { return }
        let url = URL(fileURLWithPath: path) 
        let player = AVPlayer.init(url: url)
        moviePlayer.player = player
        moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        moviePlayer.showsPlaybackControls = false
        moviePlayer.view.frame = self.view.frame
        self.view.addSubview(moviePlayer.view)
    }
    
    func startPlayVideo() {
        moviePlayer.player?.play()
    }
    
    func stopPlayVideo() {
        moviePlayer.player?.pause()
    }
    
}
