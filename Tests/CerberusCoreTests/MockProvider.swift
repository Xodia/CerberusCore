//
//  File.swift
//  
//
//  Created by Morgan Collino on 5/14/20.
//

import Foundation

struct MockProvider {

    enum Mock {
        case module
        case submodule
        case copy
        case copyPlural
        case variant
        case badVariant
        case parameter
        case badParameter

        case language
        case badLanguage
    }

    static func mock(type: Mock) -> Data {
        switch type {
        case .module:
            return moduleJSON.data(using:.utf8)!
        case .submodule:
            return submoduleJSON.data(using:.utf8)!
        case .copy:
            return copyJSON.data(using:.utf8)!
        case .copyPlural:
            return copyPluralJSON.data(using:.utf8)!
        case .variant:
            return variantJSON.data(using:.utf8)!
        case .badVariant:
            return badVariantJSON.data(using:.utf8)!
        case .parameter:
            return parameterJSON.data(using:.utf8)!
        case .badParameter:
            return badParameterJSON.data(using:.utf8)!
        case .language:
            return languageJSON.data(using:.utf8)!
        case .badLanguage:
            return badLanguageJSON.data(using:.utf8)!
        }
    }
}

