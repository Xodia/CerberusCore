//
//  value.swift
//  Cerberus
//
//  Created by Morgan Collino on 7/26/19.
//  Copyright © 2019 Stash Capital, INC. All rights reserved.
//

import Foundation

public struct Value: Codable {
    public let value: String
    public let parameters: [Parameter]?

    public init(value: String, parameters: [Parameter]?) {
        self.value = value
        self.parameters = parameters
    }
}
