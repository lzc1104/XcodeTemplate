//
//  NavigationController+Base.swift
//  SportVideo
//
//  Created by lzc1104 on 2018/5/7.
//  Copyright © 2018年 Huaying. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    struct RuntimeKey {
        static let shouldPopKey: UnsafeRawPointer = UnsafeRawPointer(bitPattern: "shouldPopKey".hashValue)!
    }
    
    var shouldPop: Bool? {
        set {
            objc_setAssociatedObject(self, UINavigationController.RuntimeKey.shouldPopKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, UINavigationController.RuntimeKey.shouldPopKey) as? Bool
        }
    }
    
    @objc dynamic func exPushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            let backButton = UIButton(type: .custom)
            backButton.setImage(UIImage(asset: Asset.Nav.navBtnBack), for: .normal)
            backButton.setTitleColor(.white, for: .normal)
            backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            backButton.sizeToFit()
            backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        }
        exPushViewController(viewController, animated: true)
    }
    
    @objc private func backAction() {
        NotificationCenter.default.post(name: NSNotification.Name("backAction"), object: nil)
        if let shouldPop = self.shouldPop, !shouldPop { return }
        popViewController(animated: true)
    }
}
