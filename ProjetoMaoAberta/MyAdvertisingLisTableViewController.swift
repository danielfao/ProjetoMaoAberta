//
//  MyAdvertisingLisTableViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Fernandes on 2017-09-10.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class MyAdvertisingLisTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    //MARK: - IBActions
    @IBAction func didTapLogout(_ sender: Any) {
        logout()
    }
    
}
