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
        
        let isLogged = Auth.auth()
        
        isLogged.addStateDidChangeListener { (isLogged, user) in
            if let userIsLogged = user {
                self.performSegue(withIdentifier: "LoginClientToClientProfileSegue", sender: nil)
            }
        }
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
                        self.performSegue(withIdentifier: Segues.LoginClientToClientProfileSegue, sender: nil)
                    }
                } else {
                    self.messageAlert(title: "Dados Incorretos", message: ErrorMessages.DefaultError)
                }
            })
        }
    }
    
    @IBAction func didTapCreateNewAccountButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: Storyboards.RegisterClientStoryboard, bundle: nil)
        let registerCompanyViewController = storyboard.instantiateViewController(withIdentifier: ViewControllers.RegisterClientViewController) as! RegisterClientViewController
        navigationController?.pushViewController(registerCompanyViewController, animated: true)
    }
    
    @IBAction func didTapForgotPasswordButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: Storyboards.ForgotPasswordStoryboard, bundle: nil)
        let forgotPasswordViewController = storyboard.instantiateViewController(withIdentifier: ViewControllers.ForgotPasswordViewController) as! ForgotPasswordViewController
        navigationController?.pushViewController(forgotPasswordViewController, animated: true)
    }
    
}
