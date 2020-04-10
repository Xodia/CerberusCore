//
//  array.swift
//  Cerberus
//
//  Created by Morgan Collino on 9/20/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

public struct CopyArray: Codable {
    public let key: String
    public let items: [Item]

    public init(key: String, items: [Item]) {
        self.key = key
        self.items = items
    }
}
