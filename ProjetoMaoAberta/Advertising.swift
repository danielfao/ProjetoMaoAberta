//
//  Advertising.swift
//  ProjetoMaoAberta
//
//  Created by Daniel Oliveira on 9/1/17.
//  Copyright © 2017 Daniel Fernandes. All rights reserved.
//

import UIKit

class Advertising {
    var id: String
    var title: String?
    var description: String?
    var initialDate: Date?
    var finalDate: Date?
    var owner: Company!
    
    init(id: String) {
        self.id = id
    }
}
