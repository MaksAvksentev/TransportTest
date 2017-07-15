//
//  DataViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class DataViewController: BaseViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let id = segue.identifier, let controller = segue.destination as? OwnerPageViewController else {
            
            return
        }
        
        switch id {
        case StoryboardSegues.fromOwnersToOwnerPage:
            controller.owner = sender as? OwnerEntity
        case StoryboardSegues.fromCarsToOwnerPage:
            controller.owner = sender as? OwnerEntity
        default:
            break
        }
    }
    
    //MARK: - Configure
    func configureTableView() {
        
        self.tableView.register(OwnerTableViewCell.nib(), forCellReuseIdentifier: OwnerTableViewCell.reuseIdentifier)
        self.tableView.register(CarTableViewCell.nib(), forCellReuseIdentifier: CarTableViewCell.reuseIdentifier)
        self.tableView.delegate = self
    }
    
    //MARK: - Actions
    @IBAction func addEntity() {}
}
