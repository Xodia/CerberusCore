//
//  copy.swift
//  Cerberus
//
//  Created by Morgan Collino on 7/26/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

struct Copy: Codable {
    let key: String
    let value: Value
}

extension Copy {
    
    var isSingle: Bool {
        return !isPlural || isInterpolatedPlural
    }
    
    var isPlural: Bool {
        return value.parameters != nil || isInterpolatedPlural
    }
    
    var isInterpolatedPlural: Bool {
        guard let parameters = value.parameters else {
            return false
        }
        
        let numberOfStringInterpolation = parameters.filter { (parameter) -> Bool in
            return parameter.type == .string
        }.count
        
        return parameters.count != numberOfStringInterpolation && numberOfStringInterpolation > 0
    }
    
}
