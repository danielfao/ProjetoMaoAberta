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
    
    static let MainLoginStoryboard : String! = "Login"
    static let RegisterClientStoryboard : String! = "RegisterClient"
    static let RegisterCompanyStoryboard : String! = "RegisterCompany"
    static let ForgotPasswordStoryboard : String! = "ForgotPassword"
    static let ClientTabBarStoryboard : String! = "ClientTabBar"
    static let CompanyTabBarStoryboard : String! = "CompanyTabBar"
    static let MainStoryboard : String! = "Main"
}

//MARK: - Storyboards
struct ViewControllers {
    private init() {}
    
    static let MainLoginViewController : String! = "mainLoginViewController"
    static let RegisterClientViewController : String! = "registerClientViewController"
    static let RegisterCompanyViewController : String! = "registerCompanyViewController"
    static let LoginClientViewController : String! = "loginClientViewController"
    static let LoginCompanyViewController : String! = "loginCompanyViewController"
    static let ForgotPasswordViewController : String! = "forgotPasswordViewController"
    static let AdvertisingViewController : String! = "advertisingViewController"
    static let CompanyViewController : String! = "companyViewController"
    static let NewAdvertisingViewController : String! = "newAdvertisingViewController"
    static let ClientTabbarViewController : String! = "clientTabbarViewController"
    static let CompanyTabbarViewController : String! = "companyTabbarViewController"
    static let InitialViewController : String! = "initialViewController"
}

struct Cells {
    private init() {}
    
    static let CompaniesCell : String! = "CompaniesCell"
    static let AdvertisingsCell : String! = "AdvertisingsCell"
    static let MyAdvertisingsCell : String! = "MyAdvertisingsCell"


}
//MARK: - Segue
struct Segues {
    private init() {}

    static let LoginClientToRegisterSegue : String! = "LoginClientToRegisterSegue"
    static let LoginCompanyToRegisterSegue : String! = "LoginCompanyToRegisterSegue"
    static let LoginClientToForgotPasswordSegue : String! = "LoginClientToForgotPasswordSegue"
    static let LoginCompanyToForgotPasswordSegue : String! = "LoginCompanyToForgotPasswordSegue"
    static let LoginCompanyToCompanyProfileSegue : String! = "LoginCompanyToCompanyProfileSegue"
    static let LoginClientToClientProfileSegue : String! = "LoginClientToClientProfileSegue"
    static let TabBarClientToLoginSegue : String! = "TabBarClientToLoginSegue"
    static let TabBarCompanyToLoginSegue : String! = "TabBarCompanyToLogin"
    static let CompanyListToCompanySegue : String! = "CompanyListToCompanySegue"
    static let AdvertisingListToAdvertisingSegue : String! = "AdvertisingListToAdvertisingSegue"
    static let AdvertisingListToEditAdvertisingSegue : String! = "AdvertisingListToEditAdvertisingSegue"
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
    static let UnexpectedError : String! = "Algo não esperado aconteceu.\n Tente novamente."
    static let EmptyFields : String! = "Alguns campos não foram preenchidos.\n Por favor, preencher todos os campos"
    static let EmailFieldEmpty : String! = "Por favor, digite o seu e-mail"
    static let PasswordsAndConfirmIncorret : String! = "Senha e Confirmação de senha devem iguais. \n Digite novamente"
    static let AuthenticationError : String! = "Problema ao realizar autenticação.\n Tente novamente."

    static let InvalidEmail : String! = "E-mail inválido.\n Digite um e-mail válido."
    static let WeakPassword : String! = "Senha muito fraca.\n A senha deve conter 6 caracteres com letras e números."
    static let EmailAlreadyUsed : String! = "E-mail já está sendo utilizado.\n Digite outro e-mail válido."
    static let LogoutError : String! = "Erro ao tentar deslogar.\n Por favor, tente novamente."
}

struct Messages {
    private init() {}
    
    static let EmailSentSuccessfully : String! = "Uma nova senha foi enviada\n para o seu e-mail."
    static let DataUpdated : String! = "Seus dados\n foram atualizados com sucesso."
}

struct FirebaseNodes {
    private init() {}
    
    struct UserType {
        static let Root : String! = "tipo"
        static let Client : String! = "voluntario"
        static let Company : String! = "organizacao"
    }
    
    struct Client {
        static let Root : String! = "usuarios"
        static let Name : String! = "nome"
        static let PhoneNumber : String! = "telefone"
        static let Email : String! = "email"
    }
    
    struct Company {
        static let Root : String! = "organizacoes"
        static let Name : String! = "nome"
        static let NickName : String! = "nomeFantasia"
        static let Cnpj : String! = "cnpj"
        static let ResponsibleName : String! = "nomeResponsavel"
        static let Email : String! = "email"
        static let PhoneNumber : String! = "telefone"
        static let Facebook : String! = "facebook"
        static let Twitter : String! = "twitter"
        static let Website : String! = "website"
        static let Description : String! = "descricao"
    }
}
