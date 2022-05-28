//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Valentin Mashutin on 11.05.2022.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private let imageViewHeight: CGFloat = 130
    private var isExpanded = true
    private var statusText = readLine()
    private var topStatusButtonConstraint: NSLayoutConstraint!
    private var spacingStatusButton: NSLayoutConstraint!
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private var zoomingImageView = UIImageView(frame: .zero)
    private var startingFrame: CGRect?
    private var backView = UIView(frame: .zero)
    private var buttonClose = UIButton()
    
    var heightImageViewCnstrnt: NSLayoutConstraint!
    var widthImageViewCnstrnt: NSLayoutConstraint!
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .systemMint
        imageView.image = UIImage(named: "ava")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageViewHeight / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "ValentinSMN"
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "Waiting for something..."
        label.font = UIFont(name: "Helvetica-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(statusChangeButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        textField.alpha = 0
        textField.returnKeyType = .continue
        textField.clearButtonMode = .always
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .yes
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layoutMargins.left = 20
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textColor = .black
        textField.font = UIFont(name: "Helvetica-Regular", size: 15)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.backgroundColor = .systemGray5
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.addSubview(avatarImageView)
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)
        
        let topImageViewCnstrnt = self.avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leadingImageViewCnstrnt = self.avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        self.heightImageViewCnstrnt = self.avatarImageView.heightAnchor.constraint(equalToConstant: 130)
        self.widthImageViewCnstrnt = self.avatarImageView.widthAnchor.constraint(equalToConstant: 130)
        
        let topNameLabelCnstrnt = self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27)
        let leadingNameLabelCnstrnt = self.nameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        let trailingNameLabelCnstrnt = self.nameLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        
        let topStatusLabelCnstrnt = self.statusLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 54)
        let leadingStatusLabelCnstrnt = self.statusLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        let trailingStatusLabelCnstrnt = self.statusLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        
        self.topStatusButtonConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)
        self.spacingStatusButton = self.setStatusButton.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 34)
        let leadingSetStatusButtonCnstrnt = self.setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailingSetStatusButtonCnstrnt = self.setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightSetStatusButtonCnstrnt = self.setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        
        let topStatusTextFieldCnstrnt = self.statusTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 8)
        let leadingStatusTextFieldCnstrnt = self.statusTextField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        let trailingStatusTextFieldCnstrnt = self.statusTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightStatusTextFieldCnstrnt = self.statusTextField.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([
            topImageViewCnstrnt, leadingImageViewCnstrnt, widthImageViewCnstrnt, heightImageViewCnstrnt, topNameLabelCnstrnt, leadingNameLabelCnstrnt, trailingNameLabelCnstrnt, topStatusLabelCnstrnt, leadingStatusLabelCnstrnt, trailingStatusLabelCnstrnt, self.topStatusButtonConstraint, self.spacingStatusButton, leadingSetStatusButtonCnstrnt, trailingSetStatusButtonCnstrnt, heightSetStatusButtonCnstrnt, topStatusTextFieldCnstrnt, leadingStatusTextFieldCnstrnt, trailingStatusTextFieldCnstrnt, heightStatusTextFieldCnstrnt
        ])
    }
    
    @objc func statusChangeButtonPressed() {
        
        self.topStatusButtonConstraint.constant = self.isExpanded ? 66 : 16
        self.spacingStatusButton.constant = self.isExpanded ? 84 : 34
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
            if self.isExpanded {
                print(self.isExpanded)
                self.setStatusButton.setTitle("Set status", for: .normal)
                self.statusTextField.isHidden = false
                self.statusTextField.alpha = 1
            } else {
                self.setStatusButton.setTitle("Show status", for: .normal)
                self.statusLabel.text = self.statusText
                self.statusTextField.isHidden = true
                self.statusTextField.alpha = 0
            }
        } completion: { _ in
            self.isExpanded.toggle()
        }

        self.statusTextField.delegate = self
        self.endEditing(true)
    }
    
    @objc func statusTextChanged() {
        statusText = statusTextField.text
    }
    
}

extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusTextField.resignFirstResponder()
        setStatusButton.resignFirstResponder()
        return true
    }
    
        
    private func layout() {
        avatarImageView.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.topAnchor.constraint(equalTo: avatarImageView.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: avatarImageView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ].compactMap({ $0 }))
    }
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.handleTapGesture(_:)))
        self.avatarImageView.addGestureRecognizer(self.tapGestureRecognizer)
    }
    
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        zoomImageView()
    }
    
    @objc func buttonTapped() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.buttonClose.alpha = 0
            self.backView.alpha = 0
            self.avatarImageView.alpha = 1
            self.avatarImageView.isHidden = false
            self.zoomingImageView.frame = self.startingFrame!
            self.zoomingImageView.alpha = 0
        }, completion: nil)
    }
    
    func zoomImageView() {
        self.startingFrame = avatarImageView.superview?.convert(avatarImageView.frame, to: nil)
        zoomingImageView = UIImageView(frame: startingFrame!)
        zoomingImageView.backgroundColor = .systemPink
        zoomingImageView.image = avatarImageView.image
        
        if let keyWindow = UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).flatMap({ $0.windows }).first(where: { $0.isKeyWindow }) {
            backView = UIView(frame: keyWindow.frame)
            
            
            setup(buttonClose)
            setup(backView)
            
            keyWindow.addSubview(backView)
            keyWindow.addSubview(zoomingImageView)
            keyWindow.addSubview(buttonClose)
            
            NSLayoutConstraint.activate([
                self.buttonClose.topAnchor.constraint(equalTo: self.backView.safeAreaLayoutGuide.topAnchor, constant: 16),
                self.buttonClose.trailingAnchor.constraint(equalTo: self.backView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                self.buttonClose.widthAnchor.constraint(equalToConstant: 20),
                self.buttonClose.heightAnchor.constraint(equalToConstant: 20)
            ])
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
                self.backView.alpha = 0.8
                self.avatarImageView.isHidden = true
                self.avatarImageView.alpha = 0
                
                self.zoomingImageView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: self.avatarImageView.frame.height / 3)
                self.zoomingImageView.center = keyWindow.center
            } completion: { _ in }
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.buttonClose.alpha = 1
            } completion: { _ in }


        }
    }
    
    func setup(_ button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.alpha = 0
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func setup(_ view: UIView) {
        view.backgroundColor = .darkGray
        view.alpha = 0
    }
}
  

