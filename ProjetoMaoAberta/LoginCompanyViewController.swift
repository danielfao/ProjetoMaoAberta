//
//  LoginCompanyViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/21/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginCompanyViewController: UIViewController, RegisterCompanyViewControllerDelegate {

    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.LoginCompanyToRegisterSegue {
            if let vc = segue.destination as? RegisterCompanyViewController {
                vc.delegate = self
            }
        }
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
                        let sb = UIStoryboard(name: Storyboards.CompanyTabBarStoryboard, bundle: nil)
                        let vc = sb.instantiateViewController(withIdentifier: ViewControllers.CompanyTabbarViewController)
                        self.navigationController?.present(vc, animated: true, completion: nil)
                    }
                } else {
                    self.messageAlert(title: "Dados Incorretos", message: ErrorMessages.DefaultError)
                }
            })
        }
    }
    
    @IBAction func didTapCreateNewAccountButton(_ sender: Any) {
        self.performSegue(withIdentifier: Segues.LoginCompanyToRegisterSegue, sender: nil)

    }
    
    @IBAction func didTapForgotPasswordButton(_ sender: Any) {
        self.performSegue(withIdentifier: Segues.LoginCompanyToForgotPasswordSegue, sender: nil)

    }
    
    //MARK: - RegisterClientViewControllerDelegate
    func didRegisterSuccess() {
        let sb = UIStoryboard(name: Storyboards.CompanyTabBarStoryboard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: ViewControllers.CompanyTabbarViewController)
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
}
