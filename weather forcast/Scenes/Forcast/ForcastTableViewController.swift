//
//  ForcastTableViewController.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol ForcastTableDisplayLogic: NSObjectProtocol {
    func displayForcastHandle(viewModel: ForcastTable.requestForcastWeater.ViewModel)
    func errorHandler(viewModel: ForcastTable.ErrorHandler.ViewModel)
}

class ForcastTableViewController: BaseViewController {
    // MARK: Class Propoties
    var interactor: ForcastTableBusinessLogic?
    var router: (NSObjectProtocol & ForcastTableRoutingLogic & ForcastTableDataPassing)?
    
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Valuable Propoties
    var lists: [ForcastListModel] = []
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        setupTableViewCell()
        
        interactor?.getForcastList(request: ForcastTable.requestForcastWeater.Request())
    }
    
    // MARK: Functions
    func setupTableViewCell() {
        tableView.register(UINib(nibName: "ForcastTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ForcastTableViewCell")
    }
    
    // MARK: IBAction
}

extension ForcastTableViewController: ForcastTableDisplayLogic {
    func displayForcastHandle(viewModel: ForcastTable.requestForcastWeater.ViewModel) {
        self.lists = viewModel.list
        self.tableView.reloadData()
    }
    
    func errorHandler(viewModel: ForcastTable.ErrorHandler.ViewModel) {
        
    }
}

extension ForcastTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForcastTableViewCell", for: indexPath) as! ForcastTableViewCell
        cell.setupCell(weather: lists[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
