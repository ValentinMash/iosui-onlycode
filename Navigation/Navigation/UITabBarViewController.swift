//
//  UITabBarViewController.swift
//  Navigation
//
//  Created by Valentin Mashutin on 03.05.2022.
//

import UIKit

class UITabBarViewController: UITabBarController {
    
    let userFeed = FeedViewController()
    let userProfile = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupTabBar()
    }
    
    func setupTabBar(){
        userFeed.tabBarItem.title = "Пост"
        userFeed.tabBarItem.image = UIImage(systemName: "bolt")
        
        userProfile.tabBarItem.title = "Профиль"
        userProfile.tabBarItem.image = UIImage(systemName: "star")
        
        viewControllers = [userFeed, userProfile]
    }


}
