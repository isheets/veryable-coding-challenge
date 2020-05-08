//
//  TableViewDataSourceDelegateProvider.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/5/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit

class TableViewDataSourceDelegateProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private let dataManager: TableViewDataManager
    private let navController: UINavigationController?
    
    init(dataManager: TableViewDataManager, navController: UINavigationController?) {
        self.dataManager = dataManager
        self.navController = navController
        super.init()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AccountCellId, for: indexPath) as! AccountCellView
        
        let account = dataManager.accounts[indexPath.row]
        cell.fillData(account: account)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAccount = dataManager.accounts[indexPath.row]
        
        let detailVC = AccountDetailViewController()
        detailVC.curAccount = selectedAccount
        
        if let validNavController = navController {
            validNavController.pushViewController(detailVC, animated: true)
        }
    }
    
    

}
