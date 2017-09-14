//
//  InitialViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 9/12/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    let type: Bool = true
    let userIsLogged: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //buscar user defaults
        if (userIsLogged) {
            if(type) {
                let sb = UIStoryboard(name: Storyboards.ClientTabBarStoryboard, bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: ViewControllers.ClientTabbarViewController)
                self.navigationController?.present(vc, animated: true, completion: nil)
            } else {
                let sb = UIStoryboard(name: Storyboards.CompanyTabBarStoryboard, bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: ViewControllers.CompanyTabbarViewController)
                self.navigationController?.present(vc, animated: true, completion: nil)
            }
        } else {
            let sb = UIStoryboard(name: Storyboards.MainLoginStoryboard, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: ViewControllers.MainLoginViewController)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
