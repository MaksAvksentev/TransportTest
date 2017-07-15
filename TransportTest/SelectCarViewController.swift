//
//  SelectCarViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class SelectCarViewController: CarsViewController {

    var owner: OwnerEntity?
    
    class var className: String {
    
        return "SelectCarViewController"
    }
    
    override func viewDidLoad() {
        
        self.dataSource = CarsDataSource(withState: .CarsWithoutOwner, owner: self.owner)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        return []
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let car = self.dataSource.dataArray[indexPath.row]
        if let id = owner?.id {
        
            car.owner_id = id
            
            if !self.dataSource.update(entity: car) {
                
                log.error("Error operation with database", LogModule: .Database)
                self.presentDataBaseAlert()
            }
            
            let _ = self.navigationController?.popViewController(animated: true)
        }
    }
}
