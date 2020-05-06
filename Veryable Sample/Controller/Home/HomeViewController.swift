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
        
        //set up table view
        accountTableView = UITableView()
        accountTableView.delegate = tableViewDataSourceDelegateProvider
        accountTableView.dataSource = tableViewDataSourceDelegateProvider
        accountTableView.register(AccountCell.self, forCellReuseIdentifier: Constants.AccountCellId)
        
        let header = UIView()
        header.backgroundColor = UIColor.vryBackground()
        header.frame = CGRect(x: 0, y: 0, width: accountTableView.frame.width, height: 16)
        accountTableView.tableHeaderView = header //add space to top
        
        accountTableView.tableFooterView = UIView() //remove empty cells from bottom
        accountTableView.backgroundColor = UIColor.vryBackground()
        accountTableView.separatorStyle = .none
        self.view.addSubview(accountTableView)
        
    }
    
    override func makeConstraints() {
        
        accountTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }

    
}
