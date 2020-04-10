//
//  module.swift
//  Cerberus
//
//  Created by Morgan Collino on 7/26/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

public struct Module: Codable {
    public let name: String
    public let submodules: [Submodule]

    public init(name: String, submodules: [Submodule]) {
        self.name = name
        self.submodules = submodules
    }
}
