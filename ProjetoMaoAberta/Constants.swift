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
}

//MARK: - Storyboards
struct Storyboards {
    
    private init() {}
    
    static let MainLoginStoryboard : String! = "MainLogin"
    static let RegisterClientStoryboard : String! = "RegisterClient"
    static let RegisterCompanyStoryboard : String! = "RegisterCompany"
    
}

//MARK: - Storyboards
struct ViewControllers {
    
    private init() {}
    
    static let MainLoginViewController : String! = "mainLoginvViewController"
    static let RegisterClientViewController : String! = "registerClientViewController"
    static let RegisterCompanyViewController : String! = "registerCompanyViewController"
    static let LoginClientViewController : String! = "loginClientViewController"
    static let LoginCompanyViewController : String! = "loginCompanyViewController"
}


//MARK: - Segue
struct Segues {
    private init() {}

    static let LoginClientToRegisterSegue : String! = "LoginClientToRegisterSegue"
    static let LoginCompanyToRegisterSegue : String! = "LoginCompanyToRegisterSegue"
    static let TabBarClientToLogin : String! = "TabBarClientToLogin"
    static let TabBarCompanyToLogin : String! = "TabBarCompanyToLogin"
}
