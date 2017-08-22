//
//  CompanyProfileViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/22/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class CompanyProfileViewController: UIViewController {
    
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
        NotificationCenter.default.addObserver(self, selector: #selector(CompanyProfileViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CompanyProfileViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Slides the view up when the keyboard is shown
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    //Slides the view back when keyboard is hidden
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    //MARK: - IBActions
    @IBAction func didTapUpdateButton(_ sender: Any) {
    }
}
