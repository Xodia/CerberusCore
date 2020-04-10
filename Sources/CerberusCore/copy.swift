//
//  copy.swift
//  Cerberus
//
//  Created by Morgan Collino on 7/26/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

public struct Copy: Codable {
    public let key: String
    public let value: Value

    public init(key: String, value: Value) {
        self.key = key
        self.value = value
    }
}

extension Copy {
    
    public var isSingle: Bool {
        return !isPlural && !isInterpolated
    }

    public var isInterpolated: Bool {
        return value.parameters?.filter { $0.type == .string }.count ?? 0 > 0
    }

    public var isPlural: Bool {
        guard let parameters = value.parameters else {
            return false
        }

        let numberOfPluralParameter = parameters.filter { (parameter) -> Bool in
            return parameter.type == .integer
        }.count

        return numberOfPluralParameter > 0
    }
    
    public var isInterpolatedPlural: Bool {
        guard let parameters = value.parameters else {
            return false
        }
        
        let numberOfStringInterpolation = parameters.filter { (parameter) -> Bool in
            return parameter.type == .string
        }.count
        
        return parameters.count != numberOfStringInterpolation && numberOfStringInterpolation > 0
    }
    
}
