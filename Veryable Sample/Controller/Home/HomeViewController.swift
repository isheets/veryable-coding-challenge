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

    //views
    var backgroundView : UIView!
    var accountTableView : UITableView!
    
    //datasource and delegate form TableView
    private var tableViewDataManager = TableViewDataManager()
    private lazy var tableViewDataSourceDelegateProvider = TableViewDataSourceDelegateProvider(dataManager: tableViewDataManager)
                                      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ACCOUNTS"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
    
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.vryBackground()
        self.view.addSubview(backgroundView)
        
        //set up table view
        accountTableView = UITableView()
        
        accountTableView.delegate = tableViewDataSourceDelegateProvider
        accountTableView.dataSource = tableViewDataSourceDelegateProvider
        accountTableView.register(AccountCell.self, forCellReuseIdentifier: Constants.AccountCellId)
        
        self.view.addSubview(accountTableView)
        
    }
    
    override func makeConstraints() {
        
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        accountTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(backgroundView)
        }
        
    }

    
}
