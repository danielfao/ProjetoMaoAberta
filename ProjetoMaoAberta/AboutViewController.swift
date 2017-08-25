//
//  AboutViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/25/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var githubView: UIView!
    @IBOutlet weak var githubImage: UIImageView!
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        //Title
        self.navigationItem.title = "Projeto Mão Aberta"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //Logout
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sair", style: .plain, target: self, action: nil)
        githubImage.tintColor = UIColor.white
    
        let tap = UITapGestureRecognizer(target: self, action: #selector(AboutViewController.didTapGithubButton))
        githubView.isUserInteractionEnabled = true
        githubView.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTapGithubButton() {
        UIApplication.shared.open(URL(string: "https://github.com/danielfao/ProjetoMaoAberta")!, options: [:], completionHandler: nil)
    }
}
