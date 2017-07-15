//
//  OwnerEntity.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 12.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class OwnerEntity: BaseEntity {

    var name: String
    
    init(id: String, name: String) {
        
        self.name = name
        super.init(id: id)
    }
    
    override var createParametrs: [Any] {
        
        return [name]
    }
    
    override var updateParametrs: [Any] {
        
        return [name, id]
    }
} 
