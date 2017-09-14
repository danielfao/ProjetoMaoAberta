//
//  CompanyProfileViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/22/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

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
        database.child(FirebaseNodes.Company.Root).child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            
            self.realNameTextField.text = value?[FirebaseNodes.Company.Name] as? String
            self.nickNameTextField.text = value?[FirebaseNodes.Company.NickName] as? String
            self.CNPJTextField.text = value?[FirebaseNodes.Company.Cnpj] as? String
            self.responsibleNameTextField.text = value?[FirebaseNodes.Company.ResponsibleName] as? String
            self.emailTextField.text = value?[FirebaseNodes.Company.Email] as? String
            self.phoneNumberTextField.text = value?[FirebaseNodes.Company.PhoneNumber] as? String
            self.facebookTextField.text = value?[FirebaseNodes.Company.Facebook] as? String
            self.twitterTextField.text = value?[FirebaseNodes.Company.Twitter] as? String
            self.websiteTextField.text = value?[FirebaseNodes.Company.Website] as? String
            self.descriptionTextView.text = value?[FirebaseNodes.Company.Description] as? String
        })
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
        let name = realNameTextField.text
        let nickName = nickNameTextField.text
        let cnpj = CNPJTextField.text
        let responsibleName = responsibleNameTextField.text
        let email = emailTextField.text
        let phoneNumber = phoneNumberTextField.text
        let facebook = facebookTextField.text
        let twitter = twitterTextField.text
        let website = websiteTextField.text
        let descricao = descriptionTextView.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        if (name?.isEmpty)! || (nickName?.isEmpty)! || (cnpj?.isEmpty)! || (responsibleName?.isEmpty)! || (email?.isEmpty)! || (phoneNumber?.isEmpty)! {
            messageAlert(title: "Dados Incompletos", message: ErrorMessages.EmptyFields)
        } else {
            self.database.child(FirebaseNodes.Company.Root).child((user?.uid)!).setValue([FirebaseNodes.Company.Name : name, FirebaseNodes.Company.NickName : nickName, FirebaseNodes.Company.Cnpj : cnpj, FirebaseNodes.Company.ResponsibleName : responsibleName, FirebaseNodes.Company.Email : email, FirebaseNodes.Company.PhoneNumber : phoneNumber, FirebaseNodes.Company.Facebook : facebook, FirebaseNodes.Company.Twitter : twitter, FirebaseNodes.Company.Website : website, FirebaseNodes.Company.Description : descricao])
            self.messageAlert(title: "Sucesso", message: Messages.DataUpdated)
        }
        
        if (!((password?.isEmpty)!)) {
            //Check if password is equals to confirm password
            if password != confirmPassword {
                messageAlert(title: "Dados Incorretos", message: ErrorMessages.PasswordsAndConfirmIncorret)
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
