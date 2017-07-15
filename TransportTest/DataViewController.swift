//
//  DataViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    //MARK: -
    func configureTableView() {
    
        self.tableView.register(OwnerTableViewCell.nib(), forCellReuseIdentifier: OwnerTableViewCell.reuseIdentifier)
        self.tableView.register(CarTableViewCell.nib(), forCellReuseIdentifier: CarTableViewCell.reuseIdentifier)
        self.tableView.delegate = self
    }
    
    @IBAction func addEntity() {}
    
    //MARK: - UITableViewDelegate
}
