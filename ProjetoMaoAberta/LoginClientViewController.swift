//
//  LoginClientViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/21/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginClientViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBActions
    @IBAction func didTapLoginButton(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if (email?.isEmpty)! || (password?.isEmpty)! {
            messageAlert(title: "Dados Incompletos", message: ErrorMessages.EmptyFields)
        } else {
            //Firebase Login with email and password
            let authentication = Auth.auth()
            authentication.signIn(withEmail: email!, password: password!, completion: { (user, error) in
                if error == nil {
                    if user == nil {
                        self.messageAlert(title: "Erro ao Autenticar", message: ErrorMessages.AuthenticationError)
                    } else {
                        //save user to userDefaults
                        //tipo de user (client ou company)
                        print("Authenticação ok",authentication)
                        let sb = UIStoryboard(name: Storyboards.ClientTabBarStoryboard, bundle: nil)
                        let vc = sb.instantiateViewController(withIdentifier: ViewControllers.ClientTabbarViewController)
                        self.navigationController?.present(vc, animated: true, completion: nil)
                    }
                } else {
                    let errorRecovered = error! as NSError
                    
                    if let errorCode = errorRecovered.userInfo["error_name"] {
                        let errorText = errorCode as! String
                        var errorMessage = ""
                        
                        switch errorText {
                        case FirebaseErrorType.InvalidEmail :
                            errorMessage = ErrorMessages.InvalidEmail
                            break
                            
                        case FirebaseErrorType.WeakPassword :
                            errorMessage = ErrorMessages.WeakPassword
                            break
                            
                        case FirebaseErrorType.EmailAlreadyUsed :
                            errorMessage = ErrorMessages.EmailAlreadyUsed
                            break
                            
                        default :
                            errorMessage = ErrorMessages.DefaultError
                        }
                        
                        self.messageAlert(title: "Dados Inválidos", message: errorMessage)
                    }
                }
            })
        }
    }
    
    @IBAction func didTapCreateNewAccountButton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: Storyboards.RegisterClientStoryboard, bundle: nil)
//        let registerCompanyViewController = storyboard.instantiateViewController(withIdentifier: ViewControllers.RegisterClientViewController) as! RegisterClientViewController
//        self.navigationController?.pushViewController(registerCompanyViewController, animated: true)
        self.performSegue(withIdentifier: Segues.LoginClientToRegisterSegue, sender: nil)
    }
    
    @IBAction func didTapForgotPasswordButton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: Storyboards.ForgotPasswordStoryboard, bundle: nil)
//        let forgotPasswordViewController = storyboard.instantiateViewController(withIdentifier: ViewControllers.ForgotPasswordViewController) as! ForgotPasswordViewController
//        self.navigationController?.pushViewController(forgotPasswordViewController, animated: true)
        self.performSegue(withIdentifier: Segues.LoginClientToForgotPasswordSegue, sender: nil)
    }
    
}
