//
//  ForgotPasswordViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/25/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

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
            let alert = UIAlertController(title: title, message: "Por favor, digite o seu e-mail", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
