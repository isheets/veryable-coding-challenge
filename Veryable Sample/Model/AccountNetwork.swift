//
//  AccountNetwork.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/8/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import Foundation
import Alamofire
import Network

//used to decode response
private struct AccountJSON: Decodable {
    let id: Int
    let account_type: String
    let account_name: String
    let desc: String
}

class AccountNetwork {
    weak var delegate: DataModelDelegate?
    let monitor = NWPathMonitor()
    var isConnected = false
    
    init(delegate: DataModelDelegate) {
        self.delegate = delegate
        
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
    func fetchAccounts() throws {
        if(isConnected){
            let request = AF.request(Constants.JsonHost)
            
            
            request.responseDecodable(of: [AccountJSON].self) { (response) in
                guard let allAccounts = response.value else { self.delegate?.failedDataUpdate()
                    return
                }
                
                var accountData = [Account]()
                for accountJSON in allAccounts {
                    accountData.append(Account(id: accountJSON.id,
                                               account_type: accountJSON.account_type,
                                               account_name: accountJSON.account_name,
                                               desc: accountJSON.desc)
                        
                    )
                }
                self.delegate?.didRecieveDataUpdate(data: accountData)
            }
            
        } else {
            throw VError.NoConnection
        }
    }
}

