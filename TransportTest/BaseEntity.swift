//
//  BaseEntity.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 13.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class BaseEntity: NSObject {

    var id: String
    
    init(id: String) {
        
        self.id = id
        super.init()
    }
    
    var createParametrs: [Any] {
    
        return [Any]()
    }
    
    var updateParametrs: [Any] {
        
        return [Any]()
    }
}
