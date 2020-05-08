//
//  HomeViewController.swift
//  Veryable Sample
//
//  Created by Pooja Kaluskar on 3/27/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController, DataModelDelegate {
    
    var homeView : HomeView!
    private var loadingIndicator = UIActivityIndicatorView(style: .large)
    
    private var tableViewDataSourceDelegateProvider: TableViewDataSourceDelegateProvider?
    private var accountNetwork: AccountNetwork?
    
    
    override func viewDidLoad() {
        
        accountNetwork = AccountNetwork(delegate: self)
        accountNetwork?.fetchAccounts()
        
        homeView = HomeView(frame: CGRect.zero)
        
        loadingIndicator.startAnimating()
        loadingIndicator.hidesWhenStopped = true
        
        
        super.viewDidLoad()
    }
    
    func didRecieveDataUpdate(data: [Account]) {
        loadingIndicator.stopAnimating()
        
        tableViewDataSourceDelegateProvider = TableViewDataSourceDelegateProvider(accounts: data, navController: self.navigationController)
        homeView.accountTableView.delegate = tableViewDataSourceDelegateProvider
        homeView.accountTableView.dataSource = tableViewDataSourceDelegateProvider
        homeView.accountTableView.register(AccountCellView.self, forCellReuseIdentifier: Constants.AccountCellId)
        homeView.accountTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "ACCOUNTS"
        
        //clear selection when user returns from details
        if let indexPath = homeView.accountTableView.indexPathForSelectedRow {
            homeView.accountTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func addSubviews() {
        super.addSubviews()
        self.view.addSubview(homeView)
        self.view.addSubview(loadingIndicator)
    }
    
    override func makeConstraints() {
        homeView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        loadingIndicator.snp.makeConstraints{ (make) in
            make.centerWithinMargins.equalTo(self.view)
        }
    }
    
}
