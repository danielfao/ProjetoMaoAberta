//
//  Client.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/21/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import Foundation

class Client {
    var id: String?
    var name: String?
    var email: String?
    var phoneNumber: Int?
    var profileImageUrl: String?
    
    init(name: String, id: String, email: String, phoneNumber: Int, profileImageUrl: String) {
        
        self.name = name
        self.id = id
        self.email = email
        self.phoneNumber = phoneNumber
        self.profileImageUrl = profileImageUrl
    }

}
