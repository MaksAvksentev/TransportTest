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

class BaseDataSource<T: BaseEntity>: NSObject, DataSourceProtocol, UITableViewDataSource {

    var type: EntityStoreType = .Undefined
    
    var dataArray: [T] {
        
        return self.getAll()
    }

    weak var delegate: DataSourceProtocol?
    
    override init() {
        
        super.init()
        self.delegate = self
        self.initialize()
    }
    
    //MARK: - DataSourceProtocol
    func typeForDataSource() -> EntityStoreType {
        
        return .Undefined
    }
    //MARK: - Main
    func initialize() {
        
        guard let type = self.delegate?.typeForDataSource() else {
            return
        }
        
        self.type = type
    }
    
    func create(entity: T) -> Bool {
        
        return DatabaseManager.shared.operation(withEntity: entity, method: .create, forType: self.type)
    }
    
    func update(entity: T) -> Bool {
    
        return DatabaseManager.shared.operation(withEntity: entity, method: .update, forType: self.type)
    }
    
    func delete(entity: T) -> Bool {
        
        return DatabaseManager.shared.operation(withEntity: entity, method: .delete, forType: self.type)
    }
    
    func getEntity(withId id: String) -> T? {
    
        let entity = DatabaseManager.shared.entity(fromData: DatabaseManager.shared.getEntity(withId: id, forType: self.type), type: self.type)
        
        return entity as! T?
    }
    
    func getAll() -> [T] {
    
        let array = DatabaseManager.shared.getArray(fromSet: DatabaseManager.shared.getAll(forType: self.type), withType: self.type)
        
        return array as! [T]
    }
    
    func getOwnersCars(owner: OwnerEntity) -> [T] {
    
        let array = DatabaseManager.shared.getArray(fromSet: DatabaseManager.shared.getOwnersCars(owner: owner), withType: self.type)
       
        return array as! [T]
    }
    
    func getAllCarsWithoutOwner() -> [T] {
        
        let array = DatabaseManager.shared.getArray(fromSet: DatabaseManager.shared.getAllCarsWithoutOwner(), withType: self.type)
        
        return array as! [T]
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}
