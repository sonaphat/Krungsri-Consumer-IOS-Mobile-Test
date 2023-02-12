//
//  CurrentWeaterRouter.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol CurrentWeaterRoutingLogic {
    func routerToForcast(list: [ForcastListModel])
}

protocol CurrentWeaterDataPassing {
    var dataStore: CurrentWeaterDataStore? { get }
}

class CurrentWeaterRouter: NSObject, CurrentWeaterDataPassing {
    
    weak var viewController: CurrentWeaterViewController?
    var dataStore: CurrentWeaterDataStore?
    
    class func newInstance(interactor: CurrentWeaterInteractor = CurrentWeaterInteractor()) -> CurrentWeaterViewController {
        let viewController = CurrentWeaterViewController(nibName: String(describing: CurrentWeaterViewController.self),
                                                                    bundle: nil)
        let interactor = interactor
        let presenter = CurrentWeaterPresenter()
        let router = CurrentWeaterRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
        
        // router.dataStore?.something = something
        
        return viewController
    }
}

extension CurrentWeaterRouter: CurrentWeaterRoutingLogic {
    func routerToForcast(list: [ForcastListModel]) {
        let forcastVC = ForcastTableRouter.newInstance(list: list)
        self.viewController?.navigationController?.pushViewController(forcastVC, animated: true)
    }
}
