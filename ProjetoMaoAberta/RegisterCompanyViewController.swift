//
//  RegisterCompanyViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/21/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

protocol RegisterCompanyViewControllerDelegate {
    func didRegisterSuccess()
}
class RegisterCompanyViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var realCompanyNameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var CNPJTextField: UITextField!
    @IBOutlet weak var responsibleNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //MARK: - Variables
    var database: DatabaseReference!
    var delegate: RegisterCompanyViewControllerDelegate?
    
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
        
        //Setup Firebase database reference
        database = Database.database().reference()
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
        let name = realCompanyNameTextField.text
        let nickName = nickNameTextField.text
        let cnpj = CNPJTextField.text
        let responsibleName = responsibleNameTextField.text
        let email = emailTextField.text
        let phoneNumber = phoneNumberTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        if (name?.isEmpty)! || (nickName?.isEmpty)! || (cnpj?.isEmpty)! || (responsibleName?.isEmpty)! || (email?.isEmpty)! || (phoneNumber?.isEmpty)! || (password?.isEmpty)! || (confirmPassword?.isEmpty)! {
            messageAlert(title: "Dados Incompletos", message: ErrorMessages.EmptyFields)
            
        } else {
            //Check if password is equals to confirm password
            if password != confirmPassword {
                messageAlert(title: "Dados Incorretos", message: ErrorMessages.PasswordsAndConfirmIncorret)
            } else {
                //Firebase Creating new user with email and password
                let user = Auth.auth()
                
                user.createUser(withEmail: email!, password: password!, completion: { (user, error) in
                    if error == nil {
                        if user == nil {
                            self.messageAlert(title: "Erro ao Autenticar", message: ErrorMessages.AuthenticationError)
                        } else {
                            self.database.child(FirebaseNodes.Company.Root).child((user?.uid)!).setValue([FirebaseNodes.Company.Name : name, FirebaseNodes.Company.NickName : nickName, FirebaseNodes.Company.Cnpj : cnpj, FirebaseNodes.Company.ResponsibleName : responsibleName, FirebaseNodes.Company.Email : email, FirebaseNodes.Company.PhoneNumber : phoneNumber])
                            self.database.child(FirebaseNodes.UserType.Root).child((user?.uid)!).setValue([FirebaseNodes.UserType.Root : FirebaseNodes.UserType.Company])
                            
                            self.navigationController?.popViewController(animated: false)
                            self.delegate?.didRegisterSuccess()
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
