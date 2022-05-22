//
//  UITabBarViewController.swift
//  Navigation
//
//  Created by Valentin Mashutin on 03.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemBlue
        setupVC()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVC() {
        viewControllers = [
            createNavController(for: FeedViewController(), title: NSLocalizedString("Лента", comment: ""), image: UIImage(systemName: "house.fill")!),
            createNavController(for: ProfileViewController(), title: NSLocalizedString("Профиль", comment: ""), image: UIImage(systemName: "person.fill")!),
        ]
    }

}
