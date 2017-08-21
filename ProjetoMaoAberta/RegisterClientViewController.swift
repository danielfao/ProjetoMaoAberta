//
//  RegisterClientViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/21/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class RegisterClientViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var phoneNumberTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var confirmPasswordTextView: UITextField!
    
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
    @IBAction func didTapRegisterButton(_ sender: Any) {
    }
}
