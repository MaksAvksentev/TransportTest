//
//  StoryboardUtilities.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import Foundation
import UIKit

struct StoryboardSegues {

    static let fromCarsToOwnerPage = "FromCarsToOwnerPage"
    static let fromOwnersToOwnerPage = "FromOwnersToOwnerPage"
}

fileprivate enum Storyboard : String {
    
    case main = "Main"
}

fileprivate extension UIStoryboard {
    
    static func loadFromMain(_ identifier: String) -> UIViewController {
        return load(from: .main, identifier: identifier)
    }
    
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}

extension UIStoryboard {
    
    class func loadOwnerManagmentFromMain(_ identifier: String) -> OwnerManagmentViewController {
        
        return loadFromMain(OwnerManagmentViewController.className) as! OwnerManagmentViewController
    }
    
    class func loadCarManagmentFromMain(_ identifier: String) -> CarManagmentViewController {
        
        return loadFromMain(CarManagmentViewController.className) as! CarManagmentViewController
    }
    
    class func loadSelectCarFromMain(_ identifier: String) -> SelectCarViewController {
        
        return loadFromMain(SelectCarViewController.className) as! SelectCarViewController
    }

}
