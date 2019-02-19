//
//  ViewController.swift
//  3DTouchQuickAction
//
//  Created by kuroky on 2019/2/19.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    private var actionLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 20, y: 100, width: 200, height: 30))
        label.textColor = UIColor.lightGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNoti(noti:)), name: NSNotification.Name(rawValue: "ShortcutAction"), object: nil)
    }
    
    func setupUI() {
        actionLabel.text = "Please Press the 3D action"
        
        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 128, height: 128))
        imageView.center = self.view.center
        imageView.image = UIImage.init(named: "fingerprint")
        self.view.addSubview(imageView)
        
        self.registerForPreviewing(with: self, sourceView: self.view)
    }

    @objc func didReceiveNoti(noti: Notification) {
        let shortcutItem = noti.userInfo?["shortcutItem"] as! UIApplicationShortcutItem
        if shortcutItem.type == "LoveItem" {
            actionLabel.text = "love item"
        }
    }
    
}

extension ViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        previewingContext.sourceRect = CGRect.init(x: 10, y: 10, width: self.view.frame.width - 20, height: self.view.frame.height - 20)
        return SFSafariViewController.init(url: NSURL.init(string: "http://www.qq.com")! as URL)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.show(viewControllerToCommit, sender: self)
    }
}

extension SFSafariViewController {
    
    open override var previewActionItems: [UIPreviewActionItem] {
        let deleteActionn = UIPreviewAction.init(title: "删除", style: .destructive) { (action, vc) in
            print("Delete")
        }
        
        let doneAction = UIPreviewAction.init(title: "完成", style: .default) { (action, vc) in
            print("Done")
        }
        
        return [deleteActionn, doneAction]
    }
}
