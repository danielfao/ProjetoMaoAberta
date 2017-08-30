//
//  CompaniesListTableViewCell.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/30/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class CompaniesListTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var advertisingTitleLabel: UILabel!
    @IBOutlet weak var expireDateLabel: UILabel!
    
    
    //MARK: - Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
