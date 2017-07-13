//
//  CarsDataSource.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 13.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

enum CarsDataSourceState {

    case All
    case OwnersCars
    case CarsWithoutOwner
}

class CarsDataSource: BaseDataSource<CarEntity>, DataSourceProtocol, UITableViewDataSource {
    
    var state: CarsDataSourceState = .All
    
    var dataArray: [CarEntity] {
        
        switch self.state {
        case .All:
            return self.getAll()
        case .OwnersCars:
            return self.
        }
        
    }
    //MARK: - 
    //MARK: - DataSourceProtocol
    func typeForDataSource() -> EntityStoreType {
        
        return .Cars
    }
    
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        return UITableViewCell()
    }
}
