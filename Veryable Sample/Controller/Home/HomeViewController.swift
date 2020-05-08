//
//  HomeViewController.swift
//  Veryable Sample
//
//  Created by Pooja Kaluskar on 3/27/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    private var homeView : HomeView!
    
    //datasource and delegate form TableView
    private var tableViewDataManager = TableViewDataManager()
    
    private lazy var tableViewDataSourceDelegateProvider = TableViewDataSourceDelegateProvider(dataManager: tableViewDataManager, navController: self.navigationController)
    
    override func viewDidLoad() {
        
        homeView = HomeView(frame: CGRect.zero)
        
        homeView.accountTableView.delegate = tableViewDataSourceDelegateProvider
        homeView.accountTableView.dataSource = tableViewDataSourceDelegateProvider
        homeView.accountTableView.register(AccountCellView.self, forCellReuseIdentifier: Constants.AccountCellId)
        
        super.viewDidLoad()
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
