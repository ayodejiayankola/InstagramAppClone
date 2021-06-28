//
//  LoginController.swift
//  InstagramAppClone
//
//  Created by Ayodeji Ayankola on 6/2/21.
//

import UIKit

class LoginController: UIViewController {
    
    
    //MARK:- Properties
    
    private var viewModel = LoginViewModel()
    
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
        loginButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        loginButton.layer.cornerRadius = 5
        loginButton.setHeight(50)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        loginButton.isEnabled = false
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
        configureNotificationObservers()
    }
    
    //MARK:- Helpers
    
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        configureGradientLayer()
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
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid
        print("DEBUG: View model email is \(viewModel.email)")
        print("DEBUG: View model password is \(viewModel.password)")
        
        print("DEBUG: View model now is \(viewModel.formIsValid)")
    }
    
    
    @objc func didTapRegister(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}


