//
//  NewAdvertisingViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/28/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class NewAdvertisingViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var beginDateView: UIView!
    @IBOutlet weak var beginDatePickerTextField: UITextField!
    @IBOutlet weak var endDateView: UIView!
    @IBOutlet weak var endDatePickerTextField: UITextField!
    
    //MARK: - Constants and Variables
    let beginDatePicker = UIDatePicker()
    let endDatePicker = UIDatePicker()
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        //Dismiss Keyboard
        self.hideKeyboardWhenTappedAround()
        self.showKeyboard()
        self.hideKeyboard()
        
        createDatePickerToBeginDate()
        createDatePickerToEndDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Begin Datepicker
    func createDatePickerToBeginDate() {
        beginDatePicker.minimumDate = Date()
        beginDatePicker.datePickerMode = .date
        beginDatePicker.locale = NSLocale.init(localeIdentifier: "pt_br") as Locale
        
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Bar buttonItem
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(didTapDoneToBeginDateButton))
        toolbar.setItems([doneButton], animated: false)
        
        beginDatePickerTextField.inputAccessoryView = toolbar
        
        //assigning datepicker to textfield
        beginDatePickerTextField.inputView = beginDatePicker
    }
    
    func didTapDoneToBeginDateButton() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = NSLocale.init(localeIdentifier: "pt_BR") as Locale!
        dateFormatter.timeStyle = .none
        
        
        beginDatePickerTextField.text = dateFormatter.string(from: beginDatePicker.date)
        self.view.endEditing(true)
    }
    
    //End Datepicker
    func createDatePickerToEndDate() {
        endDatePicker.minimumDate = Date()
        endDatePicker.datePickerMode = .date
        endDatePicker.locale = NSLocale.init(localeIdentifier: "pt_br") as Locale
        
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Bar buttonItem
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(didTapDoneToEndDateButton))
        toolbar.setItems([doneButton], animated: true)
        
        endDatePickerTextField.inputAccessoryView = toolbar
        
        //assigning datepicker to textfield
        endDatePickerTextField.inputView = endDatePicker
    }
    
    func didTapDoneToEndDateButton() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = NSLocale.init(localeIdentifier: "pt_BR") as Locale!
        dateFormatter.timeStyle = .none
        
        endDatePickerTextField.text = dateFormatter.string(from: endDatePicker.date)
        self.view.endEditing(true)
    }
    
    //MARK: - IBActions
    @IBAction func didTapSaveButton(_ sender: Any) {
    }
    
}
