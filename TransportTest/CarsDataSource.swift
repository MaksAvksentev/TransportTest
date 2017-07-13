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

class CarsDataSource: BaseDataSource<CarEntity> {
    
    var state: CarsDataSourceState = .All
    
    var owner: OwnerEntity?
    
    override var dataArray: [CarEntity] {
        
        switch self.state {
        case .All:
            return self.getAll()
        case .OwnersCars:
            return self.getOwnersCars(owner: owner!)
        case .CarsWithoutOwner:
            return self.getAllCarsWithoutOwner()
        }
    
    }
    
    init(withState state: CarsDataSourceState = .All, owner: OwnerEntity? = nil) {
        
        super.init()
        
        self.state = state
        self.owner = owner
    }
    
    //MARK: - DataSourceProtocol
    override func typeForDataSource() -> EntityStoreType {
        
        return .Cars
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.reuseIdentifier) as? CarTableViewCell else {
            return UITableViewCell()
        }
        
        cell.carName.text = self.dataArray[indexPath.row].name
        cell.yearLabel.text = String(self.dataArray[indexPath.row].year)
        
        return cell
    }
}
