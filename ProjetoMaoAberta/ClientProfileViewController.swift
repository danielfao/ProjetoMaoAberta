//
//  ClientProfileViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/22/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ClientProfileViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
   
    //MARK: - Variables
    var database: DatabaseReference!
    
    //MARK: - Constants
    var user: User?
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Keyboard functions
        self.hideKeyboardWhenTappedAround()
        self.showKeyboard()
        self.hideKeyboard()
        
        database = Database.database().reference()
        self.user = Auth.auth().currentUser
        getUserData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let user = self.user {
            database.child(FirebaseNodes.Client.Root).child(user.uid).removeAllObservers()
        }
    }
    
    func getUserData() {
        if let user = self.user {
            database.child(FirebaseNodes.Client.Root).child(user.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                
                self.nameTextField.text = value?[FirebaseNodes.Client.Name] as? String
                self.emailTextField.text = value?[FirebaseNodes.Client.Email] as? String
                self.phoneNumberTextField.text = value?[FirebaseNodes.Client.PhoneNumber] as? String
            })
        }
    }
    
    //MARK: - IBActions
    @IBAction func didTapUpdateButton(_ sender: Any) {
        let name = nameTextField.text
        let phoneNumber = phoneNumberTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        if (name?.isEmpty)! || (phoneNumber?.isEmpty)! {
            messageAlert(title: "Dados Incompletos", message: ErrorMessages.EmptyFields)
        } else {
            self.database.child(FirebaseNodes.Client.Root).child((user?.uid)!).setValue([FirebaseNodes.Client.Name : name, FirebaseNodes.Client.Email: email, FirebaseNodes.Client.PhoneNumber : phoneNumber])
            self.messageAlert(title: "Sucesso", message: Messages.DataUpdated)
        }
        
        if (!((password?.isEmpty)!)) {
            if (password != confirmPassword) {
                messageAlert(title: "Dados Incorretos", message: ErrorMessages.PasswordsAndConfirmIncorret )
            } else {
                Auth.auth().currentUser?.updatePassword(to: password!) { (error) in
                    if error != nil {
                        self.messageAlert(title: "Erro", message: ErrorMessages.AuthenticationError)
                    } else {
                        self.messageAlert(title: "Sucesso", message: Messages.DataUpdated)
                    }
                }
            }
        }
    }
    
    @IBAction func didTapLogout(_ sender: Any) {
        logout()
    }
}
