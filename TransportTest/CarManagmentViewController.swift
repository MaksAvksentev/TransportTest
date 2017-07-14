//
//  CarManagmentViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class CarManagmentViewController: DataManagmentViewController {

    var car: CarEntity?
    
    class var className: String {
        
        return "CarManagmentViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureFields()
    }
    
    func configureFields() {
        
        self.nameField.text = car?.name
        self.year.text = String(describing: car?.year)
    }
    
    //MARK: - Actions
    @IBAction override func controlButtonPressed() {
        
        super.controlButtonPressed()
        let car = CarEntity(id: self.car?.id ?? "", name: self.nameField.text!, year: Int32(self.year.text!)!, owner_id: self.car?.owner_id ?? "")
        switch self.managmentState {
        case .Add:
            let _ = DatabaseManager.shared.operation(withEntity: car, method: .create, forType: self.entityType)
        case .Edit:
            let _ = DatabaseManager.shared.operation(withEntity: car, method: .update, forType: self.entityType)
        default:
            break
        }
        
        let _ = self.navigationController?.popViewController(animated: true)
    }

}
