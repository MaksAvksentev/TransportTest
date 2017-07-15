//
//  OwnerTableViewCell.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 13.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class OwnerTableViewCell: UITableViewCell {

    @IBOutlet weak var ownerName: UILabel!
    
    class var className: String {
        
        return "OwnerTableViewCell"
    }
    
    class var reuseIdentifier: String {
        
        return self.className
    }
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: - Nib
    class func nib() -> UINib {
        
        return UINib(nibName: self.className, bundle: Bundle.main)
    }
}
