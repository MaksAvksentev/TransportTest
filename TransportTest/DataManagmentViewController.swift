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

class DataManagmentViewController: BaseViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var controlButton: UIButton!
    @IBOutlet weak var titleItem: UINavigationItem!
    
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

        self.configureTextFields()
        self.self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.configureNavigationBarAndButton()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.topItem?.title = ""
    }

    //MARK: - Private
    private func configureNavigationBarAndButton() {
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
        switch self.managmentState {
        case .Add:
            self.titleItem.title = "Add"
            self.controlButton.setTitle("Add", for: .normal)
        default:
            self.titleItem.title = "Edit"
            self.controlButton.setTitle("Save", for: .normal)
        }
    }
    
    func configureTextFields() {
    
        self.controlButton.isEnabled = false
        self.year.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        self.nameField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    //MARK: - Check TextFields
    func editingChanged(_ textField: UITextField) {
        
        if textField.text?.characters.count == 1 {
            if textField.text?.characters.first == " " {
                textField.text = ""
                return
            }
        }
        
        guard let name = nameField.text, !name.isEmpty, let tempYear = year.text, !tempYear.isEmpty, let tempYearInt = Int(tempYear), tempYearInt>=1758, tempYearInt<=2017
            else {
                controlButton.isEnabled = false
                return
        }

        controlButton.isEnabled = true
    }
    
    //MARK: - Actions
    func controlButtonPressed() { }
}
