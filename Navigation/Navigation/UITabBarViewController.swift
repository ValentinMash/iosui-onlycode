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
    let userPost = PostViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupTabBar()
    }
    
    func setupTabBar(){
        
        let navControllerFeed = UINavigationController(rootViewController: userFeed)
        userFeed.tabBarItem.title = "Статус"
        userFeed.tabBarItem.image = UIImage(systemName: "bolt")
        userFeed.navigationItem.title = "Статус пользователя"
        
        let navControllerProfile = UINavigationController(rootViewController: userProfile)
        userProfile.tabBarItem.title = "Профиль"
        userProfile.tabBarItem.image = UIImage(systemName: "smiley")
        userProfile.navigationItem.title = "Профиль пользователя"
        
        let navControllerPost = UINavigationController(rootViewController: userPost)
        userPost.tabBarItem.title = "Пост"
        userPost.tabBarItem.image = UIImage(systemName: "star")
        userPost.navigationItem.title = "Пост пользователя"
        
        viewControllers = [navControllerFeed, navControllerProfile, navControllerPost]
    }


}
