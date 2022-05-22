//
//  FeedViewController.swift
//  Navigation
//
//  Created by Valentin Mashutin on 03.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var transitionButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTransitionButton()
    }

    private func setupTransitionButton() {
        transitionButton = UIButton(type: .roundedRect)
        transitionButton.frame = CGRect(x: 20, y: 200, width: 200, height: 44)
        transitionButton.layer.cornerRadius = 12
        transitionButton.backgroundColor = .systemBlue
        transitionButton.clipsToBounds = true
        transitionButton.setTitle("Показать публикацию", for: .normal)
        transitionButton.setTitleColor(.white, for: .normal)
        transitionButton.addTarget(self, action: #selector(transitionButtonTapped), for: .touchUpInside)
        self.view.addSubview(transitionButton)
    }
    
    @objc private func transitionButtonTapped(sender: UIButton) {
        let postVC = PostViewController()
        let post = Post(title: "Новая публикация")
        postVC.navigationItem.title = post.title
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    
}

