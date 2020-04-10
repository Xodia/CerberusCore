//
//  item.swift
//  Cerberus
//
//  Created by Morgan Collino on 9/25/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

public struct Item: Codable {
    public let value: String

    public init(value: String) {
        self.value = value
    }
}
