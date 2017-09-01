//
//  Company.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/21/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import Foundation

class Company {
    var id: String
    var realCompanyName: String?
    var nickName: String?
    var CNPJ: Int?
    var responsibleName: String?
    var email: String?
    var phoneNumber: Int?
    var profileImageUrl: String?
    
    init(id: String) {
        self.id = id
    }
}
