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
        var textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .white
        textField.keyboardType = .emailAddress
        textField.keyboardAppearance = .dark
        textField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textField.setHeight(50)
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor:UIColor(white: 1, alpha: 0.7)] )
        
        return textField
        
    }()
    
    private let passwordTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .none
        textField.textColor = .white
        textField.keyboardType = .emailAddress
        textField.keyboardAppearance = .dark
        textField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textField.setHeight(50)
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor:UIColor(white: 1, alpha: 0.7)] )
        textField.isSecureTextEntry = true
        return textField
        
    }()
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK:- Helpers
    
    func configureUI(){
        
//        view.backgroundColor = .systemPink
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
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        
    }
}


