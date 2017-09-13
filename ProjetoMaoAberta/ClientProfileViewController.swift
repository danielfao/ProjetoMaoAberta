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
        let user = Auth.auth().currentUser
        database.child("usuarios").child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            
            self.nameTextField.text = value?["nome"] as? String
            self.emailTextField.text = value?["email"] as? String
            self.phoneNumberTextField.text = value?["telefone"] as? String
        })
    }
    
    //MARK: - IBActions
    @IBAction func didTapUpdateButton(_ sender: Any) {
        
    }
    
}
