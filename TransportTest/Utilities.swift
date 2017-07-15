//
//  Utilities.swift
//  TransportTest
//
//  Created by Maksim Avksentev on 14.07.17.
//  Copyright © 2017 avksentiev5@icloud.com. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    class func loadFromNibNamed(nibNamed: String, owner: AnyObject? = nil, bundle : Bundle? = nil) -> UIView? {
        
        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: owner, options: nil)[0] as? UIView
    }
}

extension UIViewController {

    func presentAlert(withTitle title: String, andMessage message: String) {
    
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboardView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboardView() {
        
        view.endEditing(true)
    }
}
