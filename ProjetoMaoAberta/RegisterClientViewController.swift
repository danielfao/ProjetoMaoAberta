//
//  RegisterClientViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/21/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegisterClientViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var phoneNumberTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var confirmPasswordTextView: UITextField!
    
    
    //MARK: - Constants
    let database = Database.database().reference()
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup navbar and change the back button color
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        
        //Keyboard functions
        self.hideKeyboardWhenTappedAround()
        self.showKeyboard()
        self.hideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBActions
    @IBAction func didTapRegisterButton(_ sender: Any) {
        let name = nameTextView.text
        let email = emailTextView.text
        let phoneNumber = phoneNumberTextView.text
        let password = passwordTextView.text
        let confirmPassword = confirmPasswordTextView.text
        
        if (name?.isEmpty)! || (email?.isEmpty)! || (phoneNumber?.isEmpty)! || (password?.isEmpty)! || (confirmPassword?.isEmpty)! {
            messageAlert(title: "Dados Incompletos", message: ErrorMessages.EmptyFields)
            
        } else {
            //Check if password is equals to confirm password
            if password != confirmPassword {
                messageAlert(title: "Dados Incorretos", message: ErrorMessages.PasswordsAndConfirmIncorret )
            } else {
                //Firebase Creating new user with email and password
                let user = Auth.auth()
                
                user.createUser(withEmail: email!, password: password!, completion: { (user, error) in
                    if error == nil {
                        if user == nil {
                            self.messageAlert(title: "Erro ao Autenticar", message: ErrorMessages.AuthenticationError)
                        } else {
                            self.database.child("usuarios").child((user?.uid)!).setValue(["nome" : name, "email" : email, "telefone" : phoneNumber, "senha" : password])
                            
                            self.performSegue(withIdentifier: Segues.LoginClientToClientProfileSegue, sender: nil)
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
    }
}
