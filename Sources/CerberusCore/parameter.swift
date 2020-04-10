//
//  parameter.swift
//  Cerberus
//
//  Created by Morgan Collino on 7/31/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

enum ParameterType: String, Codable {
    case integer
    case float
    case string
}

extension ParameterType {
    
    var iOS: String {
        switch self {
        case .integer:
            return "d"
        case .float:
            return ".2f"
        case .string:
            return "@"
        }
    }
    
    var iOSType: String {
        switch self {
        case .integer:
            return "Int"
        case .float:
            return "Double"
        case .string:
            return "String"
        }
    }
    
    var android: String {
        switch self {
        case .integer:
            return "d"
        case .float:
            return "f"
        case .string:
            return "s"
        }
    }
}

struct Parameter: Codable {
    let name: String
    let type: ParameterType
    let variants: [Variant]
}
