//
//  submodule.swift
//  Cerberus
//
//  Created by Morgan Collino on 7/26/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

public struct Submodule: Codable {
    public let name: String
    public let language: [Language]

    public init(name: String, language: [Language]) {
        self.name = name
        self.language = language
    }
}
