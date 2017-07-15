//
//  OwnerManagmentViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class OwnerManagmentViewController: DataManagmentViewController {

    var owner: OwnerEntity?
    
    class var className: String {
    
        return "OwnerManagmentViewController"
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.configureFields()
    }
    
    func configureFields() {
    
        self.nameField.text = owner?.name
    }
    
    //MARK: - Actions
    @IBAction override func controlButtonPressed() {
        
        super.controlButtonPressed()
        let owner = OwnerEntity(id: self.owner?.id ?? "", name: self.nameField.text!)
        switch self.managmentState {
        case .Add:
            let _ = DatabaseManager.shared.operation(withEntity: owner, method: .create, forType: self.entityType)
        case .Edit:
            let _ = DatabaseManager.shared.operation(withEntity: owner, method: .update, forType: self.entityType)
        default:
            break
        }
        
        let _ = self.navigationController?.popViewController(animated: true)
    }
}
