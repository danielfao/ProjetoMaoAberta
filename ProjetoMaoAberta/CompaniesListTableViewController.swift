//
//  CompaniesListTableViewController.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/29/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class CompaniesListTableViewController: UITableViewController {

    //MARK: - Variables
    var profileImage: [Any]!
    var advertisingTitleLabel: [String]!
    var expireDateLabel: [String]!
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        advertisingTitleLabel = ["Precisamos de Fraldas", "Precisamos de Alimentos não pereciveis", "Precisa-se de Pessoas", "Precisa-se de Ajuda", "Precisamos de amor", "Procura-se médicos"]
        expireDateLabel = ["08/11/2017", "08/09/2017", "08/10/2017", "08/09/2017", "24/12/2017", "11/01/2018"]
        profileImage = ["08/11/2017", "08/09/2017", "08/10/2017", "08/09/2017", "24/12/2017", "11/01/2018"]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
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
        return advertisingTitleLabel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
