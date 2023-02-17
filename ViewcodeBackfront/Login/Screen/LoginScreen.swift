//
//  LoginScreen.swift
//  ViewcodeBackfront
//
//  Created by Rafael Veronez Dias on 17/02/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        
        return label
    }()
    
    lazy var emailTextfield: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Email"
        textField.textColor = .darkGray
        
        return textField
    }()
    
    lazy var passworldTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.placeholder = "Senha"
        textField.isSecureTextEntry = true
        textField.textColor = .darkGray
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        delegate?.tappedLoginButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        addElements()
        configConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(loginLabel)
        addSubview(emailTextfield)
        addSubview(passworldTextField)
        addSubview(loginButton)
    }
    
    private func configConstrainsts() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            loginLabel.centerXAnchor.constraint(equalTo:  centerXAnchor),
            
            emailTextfield.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 45),
            emailTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextfield.heightAnchor.constraint(equalToConstant: 45),

            passworldTextField.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 20),
            passworldTextField.leadingAnchor.constraint(equalTo: emailTextfield.leadingAnchor),
            passworldTextField.trailingAnchor.constraint(equalTo: emailTextfield.trailingAnchor),
            passworldTextField.heightAnchor.constraint(equalTo: emailTextfield.heightAnchor),

            loginButton.topAnchor.constraint(equalTo: passworldTextField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: passworldTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passworldTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextfield.heightAnchor)
            
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextfield.delegate = delegate
        passworldTextField.delegate = delegate
    }
}
