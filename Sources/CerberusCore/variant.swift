//
//  variant.swift
//  Cerberus
//
//  Created by Morgan Collino on 7/31/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

public struct Variant: Codable {
    public let variant: String
    public let qualifier: QualifierType

    public init(variant: String, qualifier: QualifierType) {
        self.variant = variant
        self.qualifier = qualifier
    }
}

public enum QualifierType: String, Codable {
    case zero
    case one
    case two
    case few
    case many
    case other
}
