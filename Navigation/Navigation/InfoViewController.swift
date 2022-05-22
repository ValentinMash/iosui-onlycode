//
//  InfoViewController.swift
//  Navigation
//
//  Created by Valentin Mashutin on 05.05.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        addButton()
    }
    
    func addButton(){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Назад", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func tapAction (){
        let alert = UIAlertController(title: "Назад", message: "Точно назад?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Выйти", style: .default)
        let cancel = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
        print("Alert!")
    }
    
}
