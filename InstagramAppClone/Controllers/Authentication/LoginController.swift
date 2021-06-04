//
//  LoginController.swift
//  InstagramAppClone
//
//  Created by Ayodeji Ayankola on 6/2/21.
//

import UIKit

class LoginController: UIViewController {
    
    
    //MARK:- Properties
    
    private let logoImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "Instagram_logo_white")
        return iv
    }()
    
    private let emailTextField: UITextField = {
        var textField = CustomTextField(placeholder: "email")
        textField.keyboardType = .emailAddress
        return textField
        
    }()
    
    private let passwordTextField: UITextField = {
        var textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
        
    }()
    
    
    private let loginButton: UIButton = {
        var loginButton = UIButton(type: .system)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        loginButton.layer.cornerRadius = 5
        loginButton.setHeight(50)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return loginButton
    }()
    
    private let ForgotPasswordSigninButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Forgot your password? ", secondPart: "Reset password")
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Don't have an account?", secondPart: "Sign up")
        button.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        return button
    }()
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK:- Helpers
    
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPink.cgColor , UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view )
        logoImageView.setDimensions(height: 80, width: 120)
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, ForgotPasswordSigninButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10)
    }
    
    //MARK:- Action
    
    @objc func didTapLogin(){
        print("This is login")
    }
    
    @objc func didTapRegister(){
        self.navigationController?.pushViewController(RegistrationController(), animated: true)
    }
}


