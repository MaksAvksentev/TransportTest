//
//  OwnerManagmentViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class OwnerManagmentViewController: DataManagmentViewController {
    
    var entity: OwnerEntity?
    
    class var className: String {
    
        return "OwnerManagmentViewController"
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.configureFields()
    }

    func configureFields() {
        
        if let name = entity?.name {
            
            self.nameField.text = name
        }
    }
    
    override func configureTextFields() {
        
        self.controlButton.isEnabled = false
        self.nameField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    override func editingChanged(_ textField: UITextField) {
        
        if textField.text?.characters.count == 1 {
            if textField.text?.characters.first == " " {
                textField.text = ""
                return
            }
        }
        
        guard let name = nameField.text, !name.isEmpty else {
            
            controlButton.isEnabled = false
            return
        }
        
        controlButton.isEnabled = true
    }

    //MARK: - Actions
    @IBAction override func controlButtonPressed() {
        
        let owner = OwnerEntity(id: self.entity?.id ?? "", name: self.nameField.text!)
        
        switch self.managmentState {
        case .Add:
            
            if !DatabaseManager.shared.operation(withEntity: owner, method: .create, forType: self.entityType) {
                
                log.error("Error operation with database", LogModule: .CoreData)
                self.presentDataBaseAlert()
            }
        case .Edit:
            
            if !DatabaseManager.shared.operation(withEntity: owner, method: .update, forType: self.entityType) {
                
                log.error("Error operation with database", LogModule: .CoreData)
                self.presentDataBaseAlert()
            }
        default:
            break
        }
    
        let _ = self.navigationController?.popViewController(animated: true)
    }
}
