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
    
    
    private var tableViewDataSourceDelegateProvider: TableViewDataSourceDelegateProvider?
    private var accountNetwork: AccountNetwork?
    
    
    override func viewDidLoad() {
        homeView = HomeView(frame: CGRect.zero)
        
        accountNetwork = AccountNetwork(delegate: self)
        fetchData()
        
        super.viewDidLoad()
    }
    
    override func fetchData() {
        do {
            try accountNetwork?.fetchAccounts()
        } catch {
            print(error)
            failedDataUpdate()
        }
    }
    
    func failedDataUpdate() {
        let alert = UIAlertController(title: "Could not load accounts", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { action in
            self.fetchData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            self.homeView.loadingIndicator.stopAnimating()
        }))
        
        self.present(alert, animated: true)
    }
    
    func didRecieveDataUpdate(data: [Account]) {
        homeView.loadingIndicator.stopAnimating()
        
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
    }
    
    override func makeConstraints() {
        homeView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
}
