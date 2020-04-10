//
//  format.swift
//  Cerberus
//
//  Created by Morgan Collino on 9/23/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

public struct Format: Codable {
    public let parent: String
    public let parentFormat: String
    public let key: String
    public let type: String
    public let variants: [Variant]

    public init(parent: String, parentFormat: String, key: String, type: String, variants: [Variant]) {
        self.parent = parent
        self.parentFormat = parentFormat
        self.key = key
        self.type = type
        self.variants = variants
    }
}
