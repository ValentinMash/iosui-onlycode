//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Valentin Mashutin on 11.05.2022.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemMint
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPurple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        textField.backgroundColor = .systemTeal
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupProfileView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupProfileView() {
        self.addSubview(self.profileStackView)
        self.addSubview(self.setStatusButton)
        self.addSubview(self.statusTextField)
        self.profileStackView.addArrangedSubview(self.avatarImageView)
        self.profileStackView.addArrangedSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.fullNameLabel)
        self.labelsStackView.addArrangedSubview(self.statusLabel)
        
        let topConstraint = self.profileStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let leadingConstraint = self.profileStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        let trailingConstraint = self.profileStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        
        let avatarImageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)
        
        let topStatusButtonConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.profileStackView.bottomAnchor, constant: 20)
        let leadingStatusButtonConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.profileStackView.leadingAnchor)
        let trailingStatusButtonConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.profileStackView.trailingAnchor)
        let bottomStatusButtonConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let heightStatusButtonConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 60)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint,
            avatarImageViewAspectRatio,
            topStatusButtonConstraint, leadingStatusButtonConstraint,
            trailingStatusButtonConstraint, bottomStatusButtonConstraint, heightStatusButtonConstraint
        ].compactMap({ $0 }))
    }
   
}
