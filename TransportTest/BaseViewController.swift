//
//  BaseViewController.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 13.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    func presentDataBaseAlert() {
    
        self.presentAlert(withTitle: "Database Error", andMessage: "Request to database returned false!")
    }
}
