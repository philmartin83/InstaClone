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
    let searchController = SearchViewController()
    let imagePickerController = ImagePickerViewController()
    let likedController = LikedViewController()
    let profileController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarSetup()
        tabBarIcons()
    }
    
    private func tabbarSetup() {
        delegate = self
        tabBar.isTranslucent = false
        tabBar.tintColor = .label
        configureControllers()
        selectedIndex = 4
    }
    
    private func tabBarIcons() {
        let icon1 = UITabBarItem(title: "", image:  UIImage(named: "homeEmpty"), selectedImage: UIImage(named: "homeFilled") )
        feedController.tabBarItem = icon1
        let icon2 = UITabBarItem(title: "", image:  UIImage(named: "searchEmpty"), selectedImage: UIImage(named: "searchFilled") )
        searchController.tabBarItem = icon2
        
        let icon3 = UITabBarItem(title: "", image:  UIImage(named: "addImageEmpty"), selectedImage: UIImage(named: "addImageFilled") )
              imagePickerController.tabBarItem = icon3
        
        let icon4 = UITabBarItem(title: "", image:  UIImage(named: "like"), selectedImage: UIImage(named: "likedFilled") )
        likedController.tabBarItem = icon4
        
        let icon5 = UITabBarItem(title: "", image: UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal))
        profileController.tabBarItem = icon5
    }
    
    private func configureControllers() {
        let navigationController1 = ASNavigationController(rootViewController: feedController)
        navigationController1.navigationBar.isTranslucent = false
        let navigationController2 = ASNavigationController(rootViewController: searchController)
        navigationController2.navigationBar.isTranslucent = false
        let navigationController4 = ASNavigationController(rootViewController: likedController)
        navigationController4.navigationBar.isTranslucent = false
        let navigationController5 = ASNavigationController(rootViewController: profileController)
        navigationController5.navigationBar.isTranslucent = false
        
        viewControllers = [navigationController1, navigationController2, imagePickerController, navigationController4, navigationController5]
      
    }
    
    //MARK: - Delegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
      if viewController.isKind(of: ImagePickerViewController.self) {
         let vc =  ImagePickerViewController()
         self.present(vc, animated: true, completion: nil)
         return false
      }
      return true
    }
    
    
}
