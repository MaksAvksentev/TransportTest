//
//  CarsViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 13.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

@IBDesignable class CarsViewController: DataViewController {
    
    var dataSource = CarsDataSource()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.dataSource = self.dataSource
        self.dataSource.initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
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
        
        tableView.deselectRow(at: indexPath, animated: true)
        let car = self.dataSource.dataArray[indexPath.row]
        let tempDataSource = OwnersDataSource()
        
        if car.owner_id != "0", let owner = tempDataSource.getEntity(withId: car.owner_id) {
            
            self.performSegue(withIdentifier: StoryboardSegues.fromCarsToOwnerPage, sender: owner)
        } else {
            
            self.presentAlert(withTitle: "Attention", andMessage: "This car hasn't owner.")
        }
    }
    
     func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            
            if !self.dataSource.delete(entity: self.dataSource.dataArray[indexPath.row]) {
                
                log.error("Error operation with database", LogModule: .CoreData)
                self.presentDataBaseAlert()
            }
            
            self.tableView.reloadData()
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            
            let viewController = UIStoryboard.loadCarManagmentFromMain(CarManagmentViewController.className)
            viewController.entityType = EntityStoreType.Cars
            viewController.managmentState = .Edit
            viewController.entity = self.dataSource.dataArray[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        return [deleteAction, editAction]
    }
}
