//
//  CarEntity.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 12.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class CarEntity: BaseEntity {

    var name: String
    var year: Int32
    var owner_id: String
    
    init(id: String, name: String, year: Int32, owner_id: String) {
        
        self.name = name
        self.year = year
        self.owner_id = owner_id
        super.init(id: id)
    }
    
    override var createParametrs: [Any] {
    
        return [name, year, owner_id]
    }
    
    override var updateParametrs: [Any] {
    
        return [name, year, owner_id, id]
    }
}
