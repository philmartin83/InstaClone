//
//  TabBarController.swift
//  InstaClone
//
//  Created by Philip Martin on 26/04/2020.
//  Copyright © 2020 Phil Martin. All rights reserved.
//

import AsyncDisplayKit

class TabBarController: ASTabBarController, UITabBarControllerDelegate {
    let feedController = ViewController()
    let profileController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.isTranslucent = false
        tabBar.tintColor = .label
        let navigationController1 = ASNavigationController(rootViewController: feedController)
        navigationController1.navigationBar.isTranslucent = false
        let navigationController2 = ASNavigationController(rootViewController: profileController)
        navigationController2.navigationBar.isTranslucent = false
        tabBatIcons()
        let controllers = [navigationController1, navigationController2]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
    }
    
    private func tabBatIcons() {
        let homeEmpty = UIImage(named: "homeEmpty")
        let homeFilled = UIImage(named: "homeFilled")
        let icon1 = UITabBarItem(title: "", image: homeEmpty, selectedImage: homeFilled )
        feedController.tabBarItem = icon1
        
        
        let icon4 = UITabBarItem(title: "", image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile"))
        profileController.tabBarItem = icon4
    }
}
