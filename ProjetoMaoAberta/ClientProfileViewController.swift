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
    let user = Auth.auth().currentUser
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Keyboard functions
        self.hideKeyboardWhenTappedAround()
        self.showKeyboard()
        self.hideKeyboard()
        
        database = Database.database().reference()
        getUserData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUserData() {
            database.child("usuarios").child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            
            self.nameTextField.text = value?["nome"] as? String
            self.emailTextField.text = value?["email"] as? String
            self.phoneNumberTextField.text = value?["telefone"] as? String
        })
    }
    
    func updateData() {
        let name = nameTextField.text
        let phoneNumber = phoneNumberTextField.text
        
        if (name?.isEmpty)! || (phoneNumber?.isEmpty)! {
            messageAlert(title: "Dados Incompletos", message: ErrorMessages.EmptyFields)
        } else {
            self.database.child("usuarios").child((user?.uid)!).setValue(["nome" : name, "telefone" : phoneNumber])
        }
    }
    
    func updatePassword() {
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        if (!((password?.isEmpty)!)) {
            if (password != confirmPassword) {
                messageAlert(title: "Dados Incorretos", message: ErrorMessages.PasswordsAndConfirmIncorret )
            } else {
                Auth.auth().currentUser?.updatePassword(to: password!) { (error) in
                    //FIXME: - Implements Update Password code
                    if error == nil {

                    } else {
                        self.messageAlert(title: "Sucesso", message: Messages.DataUpdated)
                    }
                }
            }
        }

    }
    
    //MARK: - IBActions
    @IBAction func didTapUpdateButton(_ sender: Any) {
        updateData()
        updatePassword()
        
        messageAlert(title: title!, message: Messages.DataUpdated)
    }
    
}
