//
//  OwnerPageViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class OwnerPageViewController: CarsViewController {

    var owner: OwnerEntity?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        self.dataSource = CarsDataSource(withState: .OwnersCars, owner: self.owner)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.tableView.allowsSelection = false
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    //MARK: Actions
    @IBAction func editButtonDidPressed() {
    
        let alertController = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let selectAction = UIAlertAction(title: "Select car from created", style: .default, handler: {
            (action: UIAlertAction!) -> Void in

            let viewController = UIStoryboard.loadSelectCarFromMain(SelectCarViewController.className)
            viewController.owner = self.owner
            self.navigationController?.pushViewController(viewController, animated: true)
        })
        
        let addNewAction = UIAlertAction(title: "Add new car", style: .default, handler: {
            (action: UIAlertAction!) -> Void in

            let viewController = UIStoryboard.loadCarManagmentFromMain(CarManagmentViewController.className)
            viewController.entityType = EntityStoreType.Cars
            viewController.managmentState = .Add
            viewController.owner_id = self.owner?.id ?? "0"
            self.navigationController?.pushViewController(viewController, animated: true)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(selectAction)
        alertController.addAction(addNewAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let action = UITableViewRowAction(style: .normal, title: "Sell") { (action, indexPath) in
            
            let car = self.dataSource.dataArray[indexPath.row]
            car.owner_id = "0"
            
            if !self.dataSource.update(entity: car) {
                
                log.error("Error operation with database", LogModule: .CoreData)
                self.presentDataBaseAlert()
            }
            
            self.tableView.reloadData()
        }
        
        return [action]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let view = UIView.loadFromNibNamed(nibNamed: OwnerTableViewCell.className) as? OwnerTableViewCell, let name = self.owner?.name else {
        
            log.warning("OwnerPage without owner", LogModule: .UI)
            return nil
        }
        
        view.ownerName.text = "Owner: \(name)"
        view.ownerName.textColor = UIColor.green
        view.isOpaque = true
        view.tintColor = UIColor.gray
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
}
