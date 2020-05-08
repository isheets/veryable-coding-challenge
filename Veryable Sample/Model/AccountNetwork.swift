//
//  AccountNetwork.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/8/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import Foundation
import Alamofire

//used to decode response
private struct AccountJSON: Decodable {
    let id: Int
    let account_type: String
    let account_name: String
    let desc: String
}

class AccountNetwork {
    
    var accountData = [Account]()
    
    func fetchAccounts() {
        let request = AF.request("https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json")
        
        request.responseDecodable(of: [AccountJSON].self) { (response) in
            guard let allAccounts = response.value else { return }
            print(allAccounts)
            for accountJSON in allAccounts {
                self.accountData.append(Account(id: accountJSON.id,
                                           account_type: accountJSON.account_type,
                                           account_name: accountJSON.account_name,
                                           desc: accountJSON.desc)
                
                )
            }
            print(self.accountData)
        }
    }
}

