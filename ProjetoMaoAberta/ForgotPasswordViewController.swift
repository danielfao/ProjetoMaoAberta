//
//  ForgotPasswordViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/25/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        //Setup navbar and change the back button color
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        
        //Dismiss Keyboard
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBActions
    @IBAction func didTapSendEmailButton(_ sender: Any) {
        let email = emailTextField.text
        
        if (email?.isEmpty)! {
            self.messageAlert(title: title!, message: ErrorMessages.EmailFieldEmpty)
        } else {
            Auth.auth().sendPasswordReset(withEmail: email!) { (error) in
                
                if error != nil {
                    self.messageAlert(title: "Erro", message: ErrorMessages.UnexpectedError)
                } else {
                    self.messageAlert(title: "Email Enviado", message: Messages.EmailSentSuccessfully)
                }
            }
        }
    }
    
}
