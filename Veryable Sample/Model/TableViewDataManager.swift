//
//  TableViewDataManager.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/5/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import Foundation

public class TableViewDataManager {
    
    var accountNetwork = AccountNetwork()
    
    var accounts = [
        Account(id: 1, account_type: "bank", account_name: "WF Checking Account", desc: "Wells Fargo (x2356)"),
        Account(id: 2, account_type: "card", account_name: "WF Debit Card", desc: "VISA (x4363)")
    ]
    
    init() {
        accountNetwork.fetchAccounts()
    }
    
}
