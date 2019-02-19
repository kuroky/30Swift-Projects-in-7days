//
//  DetailViewController.swift
//  SpotlightSearch
//
//  Created by kuroky on 2019/2/19.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var item: [String: Any] = ["": ""]
    private var image = ""
    private var nameText = ""
    private var desc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image = item["cover"] as! String
        nameText = item["name"] as! String
        desc = item["description"] as! String
        
        let coverImageView = UIImageView(frame: CGRect(x: 10, y: 80, width: 100, height: 140))
        self.view.addSubview(coverImageView)
        coverImageView.center.x = self.view.center.x
        coverImageView.image = UIImage.init(named: image)
        
        let nameLabel = UILabel(frame: CGRect(x: 10, y: coverImageView.frame.height + 60 + 10, width: 300, height: 50))
        nameLabel.text = nameText
        nameLabel.textAlignment = .center
        nameLabel.center.x = self.view.center.x
        self.view.addSubview(nameLabel)
        
        let textViewY = coverImageView.frame.height + 50 + 50 + 10
        let textView = UITextView(frame: CGRect(x: 0, y: textViewY, width: self.view.frame.width, height: self.view.frame.height - textViewY - 10))
        self.view.addSubview(textView)
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.text = desc
    }

}
