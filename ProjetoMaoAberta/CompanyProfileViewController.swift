//
//  CompanyProfileViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/22/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class CompanyProfileViewController: UIViewController, UITextViewDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var realNameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var CNPJTextField: UITextField!
    @IBOutlet weak var responsibleNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var facebookTextField: UITextField!
    @IBOutlet weak var twitterTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        //Keyboard functions
        self.hideKeyboardWhenTappedAround()
        self.showKeyboard()
        self.hideKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == "Descrição") {
            textView.text = ""
        }
        textView.textColor = UIColor.black
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            textView.text = "Descrição"
            textView.textColor = Colors.Placeholder
        }
        textView.resignFirstResponder()
    }
    
    //MARK: - IBActions
    @IBAction func didTapUpdateButton(_ sender: Any) {
    }
}
