//
//  MainController.swift
//  SportVideo
//
//  Created by lzc1104 on 2018/5/7.
//  Copyright © 2018年 Huaying. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class MainController: UITabBarController {
    
    var indexChange: PublishSubject<Int> = PublishSubject()
    
    struct TabBarItem {
        let title: String
        let normalImage: UIImage
        let selectedImage: UIImage
        let navigationController: UINavigationController
    }
    
    private lazy var tabBarItems: [TabBarItem] = {
        var items: [TabBarItem] = []
        let communityInfo = TabBarItem(
            title: "社区",
            normalImage: UIImage(asset: Asset.Tabbar.commonTabHomeN),
            selectedImage: UIImage(asset: Asset.Tabbar.commonTabHomeS),
            navigationController: UINavigationController(rootViewController: UIViewController()))

        let videoInfo = TabBarItem(
            title: "订阅",
            normalImage: UIImage(asset: Asset.Tabbar.commonTabVideoN),
            selectedImage: UIImage(asset: Asset.Tabbar.commonTabVideoS),
            navigationController: UINavigationController(rootViewController: UIViewController()))


        let mineInfo = TabBarItem(
            title: "我的",
            normalImage: UIImage(asset: Asset.Tabbar.commonTabMeN),
            selectedImage: UIImage(asset: Asset.Tabbar.commonTabMeS),
            navigationController: UINavigationController(rootViewController: UIViewController()))

        items.append(communityInfo)
        items.append(videoInfo)
        items.append(mineInfo)
        return items
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().backgroundColor = BaseAttirbuteConfiguration.tabbarBackgroudColor
        self.delegate = self
        setupAllNavigationAndTabBarButtons()
        setupAppNavigationBar()
        exchangePushMethod()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    private func setupAllNavigationAndTabBarButtons() {
        tabBarItems.forEach {
            let navigationController = $0.navigationController
            addChildViewController(navigationController)
            navigationController.tabBarItem.title = $0.title
            navigationController.tabBarItem.image = $0.normalImage.withRenderingMode(.alwaysOriginal)
            navigationController.tabBarItem.selectedImage = $0.selectedImage.withRenderingMode(.alwaysOriginal)
            navigationController.tabBarItem.setTitleTextAttributes([
                NSAttributedStringKey.foregroundColor: BaseAttirbuteConfiguration.tabbarNormalColor
                ], for: .normal)
            navigationController.tabBarItem.setTitleTextAttributes([
                NSAttributedStringKey.foregroundColor: BaseAttirbuteConfiguration.tabbarSelectedColor
                ], for: .selected)
        }
    }
    
    private func setupAppNavigationBar() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.setBackgroundImage(BaseAttirbuteConfiguration.navigationBarBackgroudColor.toImage, for: .any, barMetrics: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: BaseAttirbuteConfiguration.navigationBarTitleColor,
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: BaseAttirbuteConfiguration.navigationBarFontSize)
        ]
    }
    
    private func exchangePushMethod() {
        let navigationController = UINavigationController()
        let originPush = class_getInstanceMethod(UINavigationController.self, #selector(navigationController.pushViewController(_:animated:)))
        let texasPush = class_getInstanceMethod(UINavigationController.self, #selector(navigationController.exPushViewController(_:animated:)))
        method_exchangeImplementations(originPush!, texasPush!)
    }
    
    
}

extension MainController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let index  = self.childViewControllers.index(of: viewController) else { return }
        self.indexChange.onNext(index)
    }
}
