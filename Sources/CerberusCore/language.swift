//
//  language.swift
//  Cerberus
//
//  Created by Morgan Collino on 9/19/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

public struct Language: Codable {
    public let identifier: String
    public let copy: [Copy]
    public let array: [CopyArray]

    public init(identifier: String, copy: [Copy], array: [CopyArray]) {
        self.identifier = identifier
        self.copy = copy
        self.array = array
    }
}
