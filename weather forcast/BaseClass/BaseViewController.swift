//
//  BaseViewController.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    
    @IBAction func dismissOrPop(_ sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
    }
}
