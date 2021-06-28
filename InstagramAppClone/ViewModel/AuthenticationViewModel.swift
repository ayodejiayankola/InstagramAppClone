//
//  AuthenticationViewModel.swift
//  InstagramAppClone
//
//  Created by Ayodeji Ayankola on 24/06/2021.
//

import UIKit


struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
    
       return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor:UIColor {
        return formIsValid ? #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1) :  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        
    }
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
    
}

struct RegistrationViewModel {
    
}
