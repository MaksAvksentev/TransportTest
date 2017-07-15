//
//  BaseTableViewCell.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    class var className: String {
        
        return "UITableViewCell"
    }
    
    class var reuseIdentifier: String {
        
        return self.className
    }

    //MARK: - Nib
    class func nib() -> UINib {
        
        return UINib(nibName: self.className, bundle: Bundle.main)
    }
}
