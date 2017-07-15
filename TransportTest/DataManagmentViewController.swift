//
//  DataManagmentViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

enum DataManagmentState {
    case Add
    case Edit
    case Undefined
}

protocol DataMangmentProtocol {
    
    func typeOfManagment() -> DataManagmentState
}

class DataManagmentViewController: UIViewController, DataMangmentProtocol {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var controlButton: UIButton!
    
    var entityType: EntityStoreType = .Undefined
    var managmentState: DataManagmentState = .Undefined
    
    init(withEntityType type: EntityStoreType, andManagmentState state: DataManagmentState) {
        
        super.init(nibName: nil, bundle: nil)
        self.entityType = type
        self.managmentState = state
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configureButton()
    }
    
    //MARK: - Private
    private func configureButton() {
        
        switch managmentState {
        case .Add:
            self.controlButton.setTitle("Add", for: .application)
        default:
            self.controlButton.setTitle("Save", for: .application)
        }
    }
    
    //MARK: - Actions
    @IBAction func controlButtonPressed() {}
    
    //MARK: - DataMangmentProtocol
    func typeOfManagment() -> DataManagmentState {
        
        return .Undefined
    }
}
