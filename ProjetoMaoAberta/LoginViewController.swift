//
//  LoginViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/14/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    //MARK: - IBActions
    @IBAction func didTapCreateAccountButton(_ sender: Any) {
        //FIXME: Create a register screen
        //For now will register the new user here. Creates a register screen
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    return
                }
                self.presentLoggedInScreen()
                print("Account created with success!")
            })
        }
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    return
                }
                print("Logged in with success")
                self.presentLoggedInScreen()
            })
        }
    }
    
    func presentLoggedInScreen(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let loggedInVC: LoginViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! LoginViewController
        self.present(loggedInVC, animated: true, completion: nil)
    }
}
