//
//  variant.swift
//  Cerberus
//
//  Created by Morgan Collino on 7/31/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

struct Variant: Codable {
    let variant: String
    let qualifier: QualifierType
}

enum QualifierType: String, Codable {
    case zero
    case one
    case two
    case few
    case many
    case other
}
