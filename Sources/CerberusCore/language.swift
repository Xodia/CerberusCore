//
//  language.swift
//  Cerberus
//
//  Created by Morgan Collino on 9/19/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

struct Language: Codable {
    let identifier: String
    let copy: [Copy]
    let array: [CopyArray]
}
