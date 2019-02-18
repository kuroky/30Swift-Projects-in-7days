//
//  Button.swift
//  TumblrMenu
//
//  Created by kuroky on 2019/2/18.
//  Copyright © 2019 Emucoo. All rights reserved.
//

import UIKit

enum ButtonImagePosition: Int {
    case PositionTop    =   1
    case PositionLeft   =   2
    case PositionBottom =   3
    case PositionRight  =   4
}

extension UIButton {
    
    func setImageAndTitle(image: String, title: String, type: ButtonImagePosition, space: CGFloat) {
        self.setTitle(title, for: .normal)
        self.setImage(UIImage.init(named: image), for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        
        let imageWidth: CGFloat = (self.imageView?.frame.width)!
        let imageHeight: CGFloat = (self.imageView?.frame.height)!
        
        let labelWidth = CGFloat((self.titleLabel?.intrinsicContentSize.width)!)
        let labelHeight = CGFloat((self.titleLabel?.intrinsicContentSize.height)!)
        
        var  imageEdgeInsets :UIEdgeInsets!
        var  labelEdgeInsets :UIEdgeInsets!
        
        switch type {
        case .PositionTop:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space/2.0, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight-space/2.0, right: 0)
        case .PositionLeft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0)
        case .PositionBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWidth, bottom: 0, right: 0)
        case .PositionRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth-space/2.0, bottom: 0, right: imageWidth+space/2.0)
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
}
