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
    
    init(dataManager: TableViewDataManager) {
        self.dataManager = dataManager
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AccountCellId, for: indexPath) as! AccountCell
        
        let account = dataManager.accounts[indexPath.row]
        
        cell.accountNameLabel.text = account.account_name
        cell.accountTypeLabel.text = account.account_type
        cell.accountDescLabel.text = account.desc
        cell.accountImage.image = UIImage(named: "bank")
        
        return cell
    }

}
