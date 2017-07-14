//
//  CarsViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 13.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class CarsViewController: DataViewController {
    
    var dataSource = CarsDataSource()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self
        self.dataSource.initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    //MARK: - Actions
    @IBAction override func addEntity()  {
        
        let viewController = UIStoryboard.loadCarManagmentFromMain(CarManagmentViewController.className)
        viewController.entityType = EntityStoreType.Cars
        viewController.managmentState = .Add
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            
            let _ = self.dataSource.delete(entity: self.dataSource.dataArray[indexPath.row])
            self.tableView.reloadData()
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            
            let viewController = UIStoryboard.loadCarManagmentFromMain(CarManagmentViewController.className)
            viewController.entityType = EntityStoreType.Cars
            viewController.managmentState = .Edit
            viewController.car = self.dataSource.dataArray[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        return [deleteAction, editAction]
    }
}
