//
//  Client.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 8/21/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import Foundation

class Client {
    var id: String
    var name: String?
    var email: String?
    var phoneNumber: Int?
    var profileImageUrl: String?
    
    init(id: String) {
        self.id = id
    }
}
