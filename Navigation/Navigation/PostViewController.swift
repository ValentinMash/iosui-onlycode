//
//  PostViewController.swift
//  Navigation
//
//  Created by Valentin Mashutin on 04.05.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post = Post()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.title = post.title
        makeBarItem()
         }
    func makeBarItem(){
        let barItem = UIBarButtonItem(title: "Дальше", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barItem
    }
    @objc func tapAction(){
        let viewController = InfoViewController()
        viewController.title = "Информация"
        navigationController?.pushViewController(viewController, animated: true)
    }

}
