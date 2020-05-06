//
//  Account.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/5/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

public struct Account {
    public let id: Int
    public let account_type: String
    public let account_name: String
    public let desc: String
    
    public let image: UIImage
    
    init(id: Int, account_type: String, account_name: String, desc: String) {
        self.id = id
        self.account_name = account_name
        self.desc = desc
        
        if account_type == Constants.CARD {
            self.image = UIImage(named: "card")?.withTintColor(UIColor.vryBlue()) ?? UIImage()
            self.account_type = "Card: Instant"
        } else if account_type == Constants.BANK {
            self.image = UIImage(named: "bank")?.withTintColor(UIColor.vryBlue()) ?? UIImage()
            self.account_type = "Bank Account: ACH - Same Day"
        } else {
            self.image = UIImage()
            self.account_type = account_type
        }
        
    }
}
