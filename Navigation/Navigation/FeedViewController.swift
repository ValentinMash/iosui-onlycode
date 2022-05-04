//
//  FeedViewController.swift
//  Navigation
//
//  Created by Valentin Mashutin on 03.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        makeButton()
    }
    
    func makeButton(){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.setTitle("Переход", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc func tapAction() {
        
    }
}
