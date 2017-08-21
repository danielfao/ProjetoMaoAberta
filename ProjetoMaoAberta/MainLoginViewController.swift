//
//  MainLoginViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/14/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class MainLoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var clientViewContainer: UIView!
    @IBOutlet weak var companyViewContainer: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.segmentedControl.selectedSegmentIndex = 0
        loginSegmentedControl(segmentedControl)
        
        //Keyboard functions
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(MainLoginViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainLoginViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isTranslucent = true
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
    @IBAction func loginSegmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0, animations: { 
                self.clientViewContainer.isHidden = false
                self.companyViewContainer.isHidden = true
            })
        }else if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0, animations: {
                self.clientViewContainer.isHidden = true
                self.companyViewContainer.isHidden = false
            })
        }
    }
}
