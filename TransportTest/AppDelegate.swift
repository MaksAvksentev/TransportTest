//
//  AppDelegate.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 12.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        DatabaseManager.shared.perfomRequest(.getAll, forEntity: .Cars)
//        DatabaseManager.shared.perfomRequest(.getAll, forEntity: .Owners)
//        DatabaseManager.shared.perfomRequest(.getAllCarsWithoutOwner, forEntity: .Owners)

        
            //DatabaseManager.shared.database.executeStatements("SHOW TABLES")

            //DatabaseManager.shared.database.executeUpdate("INSERT INTO owner_info (name) VALUES (?)", withArgumentsIn: ["dfkms"])
            
//            DatabaseManager.shared.database.executeUpdate("DELETE FROM owner_info WHERE owner_id=?", withArgumentsIn: [2])
//
//            let resultSet = DatabaseManager.shared.database.executeQuery("SELECT * FROM owner_info", withArgumentsIn: [])
//            let marrStudentInfo : NSMutableArray = NSMutableArray()
//            if (resultSet != nil) {
//                while (resultSet?.next())! {
//                    
//                    marrStudentInfo.add(resultSet?.string(forColumn: "name"))
//                   
//                }
//            }
            
        return true
    }
}
