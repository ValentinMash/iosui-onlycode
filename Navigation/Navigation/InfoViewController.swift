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
        view.backgroundColor = .systemMint
        view.addSubview(alertButton)
        self.activateConstraints()
    }
    
    private lazy var alertButton: UIButton = {
        let alertButton = UIButton()
        alertButton.layer.cornerRadius = 12
        alertButton.clipsToBounds = true
        alertButton.backgroundColor = .systemPink
        alertButton.setTitle("Узнать", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.addTarget(self, action: #selector(didTapAlertButton), for: .touchUpInside)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        return alertButton
    }()
    
    private func activateConstraints() {
        self.alertButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.alertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func didTapAlertButton(sender: UIButton) {
        self.alert(title: "Ошибка", message: "Здесь нечего открывать. Вернитесь к экрану с Публикациями", style: .actionSheet)
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertActionOk = UIAlertAction(title: "Назад", style: .cancel, handler: nil)
        let alertActionCancel = UIAlertAction(title: "Ок", style: .default, handler: nil)
        
        alertController.addAction(alertActionOk)
        alertController.addAction(alertActionCancel)
        self.present(alertController, animated: true, completion: nil)
    }
}
