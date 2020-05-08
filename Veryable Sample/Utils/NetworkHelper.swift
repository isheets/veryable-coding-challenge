//
//  NetworkHelper.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/8/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import Foundation
import Network

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    let monitor = NWPathMonitor()
    var isConnected = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        monitor.start(queue: DispatchQueue(label: "Monitor"))
    }
    
}
