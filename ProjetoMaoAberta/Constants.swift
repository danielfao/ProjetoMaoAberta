//
//  Constants.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/14/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Colors
struct Colors {
    private init() {}
    
    static let Background : UIColor! = UIColor(red: 24/255, green: 188/255, blue: 156/255, alpha: 1)
    static let Button : UIColor! = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
    static let Placeholder : UIColor! = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
}

//MARK: - Storyboards
struct Storyboards {
    private init() {}
    
    static let MainLoginStoryboard : String! = "MainLogin"
    static let RegisterClientStoryboard : String! = "RegisterClient"
    static let RegisterCompanyStoryboard : String! = "RegisterCompany"
    static let ForgotPasswordStoryboard : String! = "ForgotPassword"
    
}

//MARK: - Storyboards
struct ViewControllers {
    private init() {}
    
    static let MainLoginViewController : String! = "mainLoginvViewController"
    static let RegisterClientViewController : String! = "registerClientViewController"
    static let RegisterCompanyViewController : String! = "registerCompanyViewController"
    static let LoginClientViewController : String! = "loginClientViewController"
    static let LoginCompanyViewController : String! = "loginCompanyViewController"
    static let ForgotPasswordViewController : String! = "forgotPasswordViewController"
}


//MARK: - Segue
struct Segues {
    private init() {}

    static let LoginClientToRegisterSegue : String! = "LoginClientToRegisterSegue"
    static let LoginCompanyToRegisterSegue : String! = "LoginCompanyToRegisterSegue"
    static let LoginCompanyToCompanyProfileSegue : String! = "LoginCompanyToCompanyProfileSegue"
    static let LoginClientToClientProfileSegue : String! = "LoginClientToClientProfileSegue"
    static let TabBarClientToLogin : String! = "TabBarClientToLogin"
    static let TabBarCompanyToLogin : String! = "TabBarCompanyToLogin"
}

//MARK: - Firebase Errors
struct FirebaseErrorType {
    private init() {}
    
    static let InvalidEmail : String! = "ERROR_INVALID_EMAIL"
    static let WeakPassword : String! = "ERROR_WEAK_PASSWORD"
    static let EmailAlreadyUsed : String! = "ERROR_EMAIL_ALREADY_IN_USE"
}

struct ErrorMessages {
    private init() {}

    static let DefaultError : String! = "Dados digitados estão incorretos.\n Por favor, conferir todos os campos."
    static let EmptyFields : String! = "Alguns campos não foram preenchidos.\n Por favor, preencher todos os campos"
    static let PasswordsAndConfirmIncorret : String! = "Senha e Confirmação de senha devem iguais. \n Digite novamente"
    static let AuthenticationError : String! = "Problema ao realizar autenticação.\n Tente novamente."

    static let InvalidEmail : String! = "E-mail inválido.\n Digite um e-mail válido."
    static let WeakPassword : String! = "Senha muito fraca.\n A senha deve conter 6 caracteres com letras e números."
    static let EmailAlreadyUsed : String! = "E-mail já está sendo utilizado.\n Digite outro e-mail válido."
}
