//
//  AccountNetwork.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/8/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import Foundation
import Alamofire

class AccountNetwork {
    
    func fetchAccounts() {
        let request = AF.request("https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json")
        // 2
        request.responseJSON { (data) in
          print(data)
        }
    }
}

