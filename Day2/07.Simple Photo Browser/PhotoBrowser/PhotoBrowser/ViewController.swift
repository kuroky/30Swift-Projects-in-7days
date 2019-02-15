//
//  ViewController.swift
//  PhotoBrowser
//
//  Created by kuroky on 2019/2/15.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        guard let image = UIImage.init(named: "samplePhoto.jpeg") else { return }
        let scrollView = UIScrollView.init(frame: self.view.bounds)
        scrollView.contentSize = image.size
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        self.view.addSubview(scrollView)
        imageView = UIImageView.init(image: image)
        let offset = image.size.height / image.size.width * self.view.frame.size.width
        imageView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: offset)
        imageView.center = self.view.center
        scrollView.addSubview(imageView)
    }

}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
