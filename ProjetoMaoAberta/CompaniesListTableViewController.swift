//
//  CompaniesListTableViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/29/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class CompaniesListTableViewController: UITableViewController {
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.CompaniesCell, for: indexPath) as! CompaniesListTableViewCell
        
        return cell
    }
}
