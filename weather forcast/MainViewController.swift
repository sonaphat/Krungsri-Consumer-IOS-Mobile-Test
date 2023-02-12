//
//  ViewController.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//

import UIKit

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let WeatherVC = CurrentWeaterRouter.newInstance()
        self.navigationController?.pushViewController(WeatherVC, animated: true)
    }
    
}

