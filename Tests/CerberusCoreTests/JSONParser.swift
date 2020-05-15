//
//  File.swift
//  
//
//  Created by Morgan Collino on 5/14/20.
//

import Foundation

class JSONParser {

    public static func decode<T: Decodable>(_ type: T.Type, from data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        var decodedValue: T?

        do {
            decodedValue = try decoder.decode(type, from: data)
        } catch let  error {
            print(error)
        }

        return decodedValue
    }

}
