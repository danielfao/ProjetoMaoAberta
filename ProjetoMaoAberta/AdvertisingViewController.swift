//
//  AdvertisingViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Fernandes on 2017-09-10.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class AdvertisingViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var advertisingTitleLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var beginDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
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
    @IBAction func didTapWantToHelpButton(_ sender: Any) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
