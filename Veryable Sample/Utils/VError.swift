//
//  Error.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/6/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import Foundation

public enum VError:Error {
    case UnkownValue(desc: String)
    case NoConnection
    case ParsingError
}
