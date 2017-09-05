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
        self.showKeyboard()
        self.hideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: false)
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: false)
        self.navigationController?.navigationBar.isTranslucent = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
