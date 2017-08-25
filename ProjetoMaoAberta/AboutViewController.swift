//
//  AboutViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/25/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    //
    override func viewDidLoad() {
        super.viewDidLoad()

        //Title
        self.navigationItem.title = "Projeto Mão Aberta"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //Logout
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sair", style: .plain, target: self, action: nil)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: IBAction
    @IBAction func didTapGithubButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://github.com/danielfao/ProjetoMaoAberta")!, options: [:], completionHandler: nil)
    }
    
}
