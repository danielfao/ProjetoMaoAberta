//
//  InitialViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 9/12/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class InitialViewController: UIViewController {
    
    //MARK: - Variables
    var database: DatabaseReference!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isHidden = false
        
        database = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.user = Auth.auth().currentUser
        if user != nil {
            getUserType { (userType) in
                if(userType == "voluntario") {
                    let sb = UIStoryboard(name: Storyboards.ClientTabBarStoryboard, bundle: nil)
                    let vc = sb.instantiateViewController(withIdentifier: ViewControllers.ClientTabbarViewController)
                    self.navigationController?.present(vc, animated: true, completion: nil)
                } else {
                    let sb = UIStoryboard(name: Storyboards.CompanyTabBarStoryboard, bundle: nil)
                    let vc = sb.instantiateViewController(withIdentifier: ViewControllers.CompanyTabbarViewController)
                    self.navigationController?.present(vc, animated: true, completion: nil)
                }
            }
        } else {
            let sb = UIStoryboard(name: Storyboards.MainLoginStoryboard, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: ViewControllers.MainLoginViewController)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func getUserType(_ completion: @escaping (String) -> Void) {
        database.child(FirebaseNodes.UserType.Root).child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
            let dict = snapshot.value as? [String : Any]
            if let type = dict? [FirebaseNodes.UserType.Root] as? String {
                completion(type)
            }
        })
    }
}
