//
//  submodule.swift
//  Cerberus
//
//  Created by Morgan Collino on 7/26/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

struct Submodule: Codable {
    let module: String
    let language: [Language]
}
