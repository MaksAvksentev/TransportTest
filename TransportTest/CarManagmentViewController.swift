//
//  CarManagmentViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class CarManagmentViewController: DataManagmentViewController {

    var entity: CarEntity?
    var owner_id: String = "0"
    
    class var className: String {
        
        return "CarManagmentViewController"
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.configureFields()
    }
    
    func configureFields() {
        
        
        if let tempYear = entity?.year, let name = entity?.name {
        
            self.nameField.text = name
            self.year.text = String(describing: tempYear)
        }
    }
    
    //MARK: - Actions
    @IBAction override func controlButtonPressed() {
        
        let car = CarEntity(id: self.entity?.id ?? "", name: self.nameField.text!, year: Int32(self.year.text!)!, owner_id: self.entity?.owner_id ?? owner_id)
        
        switch self.managmentState {
        case .Add:
            
            if !DatabaseManager.shared.operation(withEntity: car, method: .create, forType: self.entityType) {
                
                log.error("Error operation with database", LogModule: .CoreData)
                self.presentDataBaseAlert()
            }
        case .Edit:
            
            if !DatabaseManager.shared.operation(withEntity: car, method: .update, forType: self.entityType) {
                
                log.error("Error operation with database", LogModule: .CoreData)
                self.presentDataBaseAlert()
            }
        default:
            break
        }
    
        let _ = self.navigationController?.popViewController(animated: true)
    }
}
