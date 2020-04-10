//
//  parameter.swift
//  Cerberus
//
//  Created by Morgan Collino on 7/31/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

public enum ParameterType: String, Codable {
    case integer
    case float
    case string
}

extension ParameterType {
    
    public var iOS: String {
        switch self {
        case .integer:
            return "d"
        case .float:
            return ".2f"
        case .string:
            return "@"
        }
    }
    
    public var iOSType: String {
        switch self {
        case .integer:
            return "Int"
        case .float:
            return "Double"
        case .string:
            return "String"
        }
    }
    
    public var android: String {
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

public struct Parameter: Codable {
    public let name: String
    public let type: ParameterType
    public let variants: [Variant]

    public init(name: String, type: ParameterType, variants: [Variant]) {
        self.name = name
        self.type = type
        self.variants = variants
    }
}
