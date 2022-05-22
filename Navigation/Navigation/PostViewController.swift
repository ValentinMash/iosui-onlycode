//
//  PostViewController.swift
//  Navigation
//
//  Created by Valentin Mashutin on 04.05.2022.
//

import UIKit

import Foundation

struct Post {
    var title: String
}

class PostViewController: UIViewController {

    let infoIcon = UIImage(systemName: "info.circle")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Публикации"
        self.view.backgroundColor = .yellow
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: infoIcon, style: .plain, target: self, action: #selector(infoButtonTapped))
    }
    
    @objc func infoButtonTapped() {
        let infoVC = InfoViewController()
        self.navigationController?.present(infoVC, animated: true, completion: nil)

    }
}
