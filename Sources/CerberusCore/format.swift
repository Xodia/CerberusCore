//
//  format.swift
//  Cerberus
//
//  Created by Morgan Collino on 9/23/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

struct Format: Codable {
    let parent: String
    let parentFormat: String
    let key: String
    let type: String
    let variants: [Variant]
}
