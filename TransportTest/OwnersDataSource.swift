//
//  OwnersDataSource.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 13.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class OwnersDataSource: BaseDataSource<OwnerEntity> {

    //MARK: - Init
    required init() {
        super.init()
    }
    
    //MARK: - DataSourceProtocol
    override func typeForDataSource() -> EntityStoreType {
        
        return .Owners
    }
    
    //MARK: - UITableView Data Source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OwnerTableViewCell.reuseIdentifier) as? OwnerTableViewCell else {
            return UITableViewCell()
        }
        
        cell.ownerName.text = self.dataArray[indexPath.row].name
        
        return cell

    }
}
