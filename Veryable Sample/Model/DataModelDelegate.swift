//
//  DataModelDelegate.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/8/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import Foundation


protocol DataModelDelegate: class {
    func didRecieveDataUpdate(data: [Account])
}
