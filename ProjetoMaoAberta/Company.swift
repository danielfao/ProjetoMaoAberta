//
//  Company.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/21/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class Company {
    var id: String
    var realCompanyName: String?
    var nickName: String?
    var cnpj: Int?
    var responsibleName: String?
    var email: String?
    var phoneNumber: Int?
    var profileImageUrl: UIImage?
    
    init(id: String) {
        self.id = id
    }
}
