//
//  BaseDataSource.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 13.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

protocol DataSourceProtocol: class {
    
    func typeForDataSource() -> EntityStoreType
}

class BaseDataSource<T: BaseEntity>: NSObject {

    var type: EntityStoreType = .Undefined
    
    var dataArray: [T] {
        
        return self.getAll()
    }

    weak var delegate: DataSourceProtocol?
    
    override init() {
        
        super.init()
        self.initialize()
    }
    
    init(forType type: EntityStoreType) {
        
        self.type = type
        
        super.init()
    }
    
    //MARK: - Main
    func initialize() {
        
        guard let type = self.delegate?.typeForDataSource() else {
            return
        }
        
        self.type = type
    }
    
    func create(entity: T) -> Bool {
        
        return DatabaseManager.shared.operation(withEntity: entity, method: .update, forType: self.type)
    }
    
    func update(entity: T) -> Bool {
    
        return DatabaseManager.shared.operation(withEntity: entity, method: .update, forType: self.type)
    }
    
    func delete(entity: T) -> Bool {
        
        return DatabaseManager.shared.operation(withEntity: entity, method: .update, forType: self.type)
    }
    
    func getEntity(withId id: String) -> T? {
    
        guard let tempSet = DatabaseManager.shared.getEntity(withId: id, forType: self.type) else {
        
            return nil
        }
        
        return DatabaseManager.shared.entity(fromData: tempSet, type: self.type)
    }
    
    func getAll() -> [T] {
    
        var array = [T]()
        guard let set = DatabaseManager.shared.getAll(forType: self.type) else {
        
            return array
        }
        
        while set.next() {
            
            if let entity = DatabaseManager.shared.entity(fromData: set, type: self.type) as? T {
            
                array.append(entity)
            }
        }
        
        return array
    }
}
