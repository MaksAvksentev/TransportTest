//
//  DatabaseManager.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 12.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit
import FMDB

class DatabaseManager: NSObject {
    
    private static let sharedStore = DatabaseManager()
    
    static var shared: DatabaseManager {
        
        return sharedStore
    }
    
    private var database = FMDatabase()
    
    //MARK: - Init
    private override init() {
    
        super.init()
        
        self.initialize()
    }
    
    //MARK: - Requests
    func operation<T: BaseEntity>(withEntity entity: T, method: DatabaseMethods, forType type: EntityStoreType) -> Bool {
        
        let request = DatabaseMethods.prepareRequest(method, forType: type)
        var result = false
        self.database.open()
            switch method {
            case .create:
                result = self.database.executeUpdate(request, withArgumentsIn: entity.createParametrs)
            case .update:
                result = self.database.executeUpdate(request, withArgumentsIn: entity.updateParametrs)
            case .delete:
                result = self.database.executeUpdate(request, withArgumentsIn: [entity.id])
            default:
                result = false
            }
        self.database.close()
        
        return result
    }
    
    func getEntity(withId id: String, forType type: EntityStoreType) -> FMResultSet? {
        
        self.database.open()
        let request = DatabaseMethods.prepareRequest(.get, forType: type)
        let set = self.database.executeQuery(request, withArgumentsIn: [id])
        
        return set
    }
    
    func getAll(forType type: EntityStoreType) -> FMResultSet? {
        
        self.database.open()
        let request = DatabaseMethods.prepareRequest(.getAll, forType: type)
        let set = self.database.executeQuery(request, withArgumentsIn: [])
        
        return set
    }
    
    func getAllCarsWithoutOwner() -> FMResultSet? {
    
        self.database.open()
        let request = DatabaseMethods.prepareRequest(.getAllCarsWithoutOwner, forType: EntityStoreType.Owners)
        let set = self.database.executeQuery(request, withArgumentsIn: [])
        
        return set
    }
    
    func getOwnersCars(owner: OwnerEntity) -> FMResultSet? {
    
        self.database.open()
        let request = DatabaseMethods.prepareRequest(.getOwnersCars, forType: EntityStoreType.Owners)
        let set = self.database.executeQuery(request, withArgumentsIn: [owner.id])
        
        return set
    }
    
    func entity<T: BaseEntity>(fromData data: FMResultSet?, type: EntityStoreType) -> T? {
        
        guard let data = data else {
            
            return nil
        }
        
        switch type {
        case .Cars:
            
                let name = data.string(forColumn: "name")
                let owner_id = data.string(forColumn: "owner_id")
                let id = String(data.int(forColumn: "id"))
                let year = data.int(forColumn: "year")
                let car = CarEntity(id: id, name: name!, year: year, owner_id: owner_id!)
                
                return car as? T
            
        case .Owners:
            
            
                let id = data.string(forColumn: "owner_id")
                let name = data.string(forColumn: "name")
                
                let owner = OwnerEntity(id: id!, name: name!)
                
                return owner as? T
            
        case .Undefined:
            
            break
        }
        
        return nil
    }
    
    func getArray<T: BaseEntity>(fromSet set: FMResultSet?, withType type: EntityStoreType) -> [T] {
        
        var array = [T]()
        
        guard let tempSet = set else {
        
            self.database.close()
            
            return array
        }
        
        while tempSet.next() {
            
            if let entity = DatabaseManager.shared.entity(fromData: tempSet, type: type) as? T {
                
                array.append(entity)
            }
        }
        
        self.database.close()
        
        return array
        
    }
    
    //MARK: - Private
    private func initialize(){
        
        self.copyResources()
        
        guard let paths = self.getPaths(), FileManager.default.fileExists(atPath: paths.1.path) else{
            
            return
        }
        
        self.database = FMDatabase(url: paths.1)
    }
    
    private func copyResources() {
        
        if let paths = self.getPaths(), !FileManager.default.fileExists(atPath: paths.1.path) {
            
            do {
                
                try FileManager.default.copyItem(atPath: paths.0.path, toPath: paths.1.path)
                
            } catch _  {
                
                //FIXME: - Handle Error with copy DB
            }
        }
    }
    
    private func getPaths() -> (URL, URL)? {
    
        guard let toPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(DatabaseParametrs.fileName), let fromPath = Bundle.main.resourceURL?.appendingPathComponent(DatabaseParametrs.fileName) else {
            
            return nil
        }
        
        return (fromPath, toPath)
    }
}
