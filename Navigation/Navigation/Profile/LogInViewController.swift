//
//  LogInViewController.swift
//  Navigation
//
//  Created by Ilya on 23.02.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.backgroundColor = .systemBlue
        button.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 10
        button.center = contentView.center
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        //self.navigationController?.navigationBar.isHidden = true
        self.setupView()
        self.setupConstraints()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

    }
    
    private func setupView() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(logInButton)
        
        let textFields = [emailTextField, passwordTextField]
        
        textFields.enumerated().forEach({ (index, textField) in
            textField.tintColor = .darkGray
            textField.backgroundColor = .systemGray6
            textField.font = .systemFont(ofSize: 16, weight: .regular)
            textField.textColor = .black
            textField.autocapitalizationType = .none
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
            textField.leftViewMode = .always
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.layer.borderWidth = 0.5
            textField.returnKeyType = .continue
            textField.delegate = self
            
            switch index {
            case 0:
                textField.placeholder = "Email of phone"
                textField.keyboardType = .emailAddress
            case 1:
                textField.placeholder = "Password"
                textField.isSecureTextEntry = true
            default:
                break
            }
            
            self.stackView.addArrangedSubview(textField)
        })
    }
    
    private func setupConstraints() {
        let srollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let srollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let srollViewLeadingConstraint = self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let srollViewTrailingConstraint = self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        let contentViewTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentViewHeightXConstraint = self.contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        let contentViewBottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let contentViewWidthConstraint = self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        
        let imageViewTopConstraint = self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)
        let imageViewWidthConstraint = self.imageView.widthAnchor.constraint(equalToConstant: 100)
        let imageViewHeigthConstraint = self.imageView.heightAnchor.constraint(equalToConstant: 100)
        let imageViewCenterXConstraint = self.imageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        
        let stackViewTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 120)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        
        let logInButtonTopConstraint = self.logInButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let logInButtonHeightConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        let logInButtonWidthConstraint = self.logInButton.widthAnchor.constraint(equalTo: self.stackView.widthAnchor)
        let logInButtonLeadingConstraint = self.logInButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
            srollViewTopConstraint, srollViewBottomConstraint, srollViewLeadingConstraint, srollViewTrailingConstraint, contentViewTopConstraint, contentViewHeightXConstraint, contentViewBottomConstraint, contentViewWidthConstraint, stackViewTopConstraint, stackViewTrailingConstraint, stackViewLeadingConstraint, imageViewTopConstraint, imageViewWidthConstraint, imageViewHeigthConstraint, imageViewCenterXConstraint, logInButtonHeightConstraint, logInButtonTopConstraint, logInButtonWidthConstraint, logInButtonLeadingConstraint
        ].compactMap({ $0 }))
        
        for textField in self.stackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                textField.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
                textField.heightAnchor.constraint(equalToConstant: 50)
            ].compactMap({ $0 }))
        }
        
    }
    
    @objc func logInTapped() {
        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
        
        switch logInButton.state {
        case .normal:
            logInButton.alpha = 1
        case .selected:
            logInButton.alpha = 0.8
        case .highlighted:
            logInButton.alpha = 0.8
        case .disabled:
            logInButton.alpha = 0.8
        default:
            break
        }
    }
    
    @objc func adjustForKeyboard (notification: Notification){
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
                
            let contentOffset: CGPoint = notification.name == UIResponder.keyboardWillHideNotification
            ? .zero
            : CGPoint(x: 0, y: keyboardHeight / 6)
            self.scrollView.contentOffset = contentOffset
        }
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}
