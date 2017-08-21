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
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        //Keyboard functions
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterClientViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterClientViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
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
    @IBAction func didTapRegisterButton(_ sender: Any) {
    }
}
