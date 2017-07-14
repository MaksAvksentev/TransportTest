//
//  DatabaseMethods.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 12.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import Foundation

enum EntityStoreType {
    
    case Cars
    case Owners
    case Undefined
    
    func tableName() -> String {
        switch self {
        
        case .Cars:
            return "car_info"
        case .Owners:
            return "owner_info"
        default:
            return ""
        }
    }
    
    func requestArguments(forMethod method: DatabaseMethods) -> String {
    
        switch self {
        case .Cars:
            switch method {
            case .create:
                return "(name, year, owner_id) VALUES (?, ?, ?)"
            case .get:
                return "WHERE owner_id=?"
            case .update:
                return "name=?, year=?, owner_id=? WHERE car_id=?"
            case .delete:
                return "WHERE car_id=?"
            default:
                return ""
            }
            
        case .Owners:
            switch method {
            case .create:
                return "(name) VALUES (?)"
            case .get:
                return "WHERE owner_id=?"
            case .update:
                return "name=? WHERE owner_id=?"
            case .delete:
                return "WHERE owner_id=?"
            case .getAllCarsWithoutOwner:
                return "WHERE owner_id=?"
            case .getOwnersCars:
                return "WHERE \(EntityStoreType.Owners.tableName()).owner_id = \(EntityStoreType.Cars.tableName()).owner_id AND \(EntityStoreType.Owners.tableName()).owner_id=?"
            default:
                return ""
            }
        case.Undefined:
            return ""
        }
        
    }
}

enum DatabaseMethods {

    case create
    case update
    case get
    case delete
    
    case getAll
    
    case getAllCarsWithoutOwner
    case getOwnersCars
    
    static func prepareRequest(_ method: DatabaseMethods, forType type: EntityStoreType) -> String {
    
        switch method {
        case .create:
            return "INSERT INTO \(type.tableName()) \(type.requestArguments(forMethod: method))"
        case .update:
            return "UPDATE \(type.tableName()) SET \(type.requestArguments(forMethod: method))"
        case .get:
            return "SELECT * FROM \(type.tableName()) \(type.requestArguments(forMethod: method))"
        case .delete:
            return "DELETE FROM \(type.tableName()) \(type.requestArguments(forMethod: method))"
        case .getAll:
            return "SELECT * FROM \(type.tableName())"
        case .getAllCarsWithoutOwner:
            return "SELECT * FROM \(EntityStoreType.Cars.tableName()) \(type.requestArguments(forMethod: method))"
        case .getOwnersCars:
            return "SELECT * FROM \(EntityStoreType.Owners.tableName()) JOIN \(EntityStoreType.Cars.tableName()) \(type.requestArguments(forMethod: method))"
        }
    }
}
