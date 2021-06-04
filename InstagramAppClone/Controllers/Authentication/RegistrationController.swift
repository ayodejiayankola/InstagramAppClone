//
//  RegistrationController.swift
//  InstagramAppClone
//
//  Created by Ayodeji Ayankola on 6/2/21.
//
import UIKit

class RegistrationController: UIViewController {
    
    
    //MARK:- Properties
    
    private let logoImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "plus_photo")
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
    
    private let fullNameTextField: UITextField = {
        var textField = CustomTextField(placeholder: "Full Name")
        textField.isSecureTextEntry = true
        return textField
        
    }()
    private let userNameTextField: UITextField = {
        var textField = CustomTextField(placeholder: "Username")
        textField.isSecureTextEntry = true
        return textField
        
    }()
    
    private let registerButton: UIButton = {
        var registerButton = UIButton(type: .system)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.setTitle("Log In", for: .normal)
        registerButton.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        registerButton.layer.cornerRadius = 5
        registerButton.setHeight(50)
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        registerButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return registerButton
    }()
    
    private let haveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account?", secondPart: "Login")
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
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
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, userNameTextField , haveAccountButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        view.addSubview(haveAccountButton)
        haveAccountButton.centerX(inView: view)
        haveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10)
    }
    
    //MARK:- Action
    
    @objc func didTapLogin(){
        self.navigationController?.pushViewController(LoginController(), animated: true)
    }
    
    @objc func didTapRegister(){
  
    }
}


