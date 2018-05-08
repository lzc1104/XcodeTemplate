//
//  UIColor+Base.swift
//  SportVideo
//
//  Created by lzc1104 on 2018/5/7.
//  Copyright © 2018年 Huaying. All rights reserved.
//

import Foundation
import SwiftHEXColors
import FoundationExtension

extension UIColor {
    
    var toImage: UIImage {
        return UIImage.from(self)
    }
}

extension UIColor {
    
    static func initWithRGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
}
