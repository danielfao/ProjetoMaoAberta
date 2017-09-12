//
//  ClientTabbarViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/25/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class ClientTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isTranslucent = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
