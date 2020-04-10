//
//  File.swift
//  
//
//  Created by Morgan Collino on 11/22/19.
//

import Foundation

public enum LintError {
    case duplicatedCopyTranslation(module: Module, submodule: Submodule, language: Language, copy: Copy)
    case emptyCopy(module: Module, submodule: Submodule, language: Language, copy: Copy)
    case missingLanguageCopy(module: Module, submodule: Submodule, language: Language, copy: Copy)

    public var message: String {
        switch self {
        case .duplicatedCopyTranslation(_, _, _, let copy):
            return "Duplication: \(copy.key)"
        case .emptyCopy(_, _, _, let copy):
            return "Empty copy: \(copy.key)"
        case .missingLanguageCopy(_, _, _, let copy):
            return "Missing copy: \(copy.key)"
        }
    }

    public var errorLocation: (module: Module, submodule: Submodule, language: Language, copy: Copy) {
        switch self {
        case .duplicatedCopyTranslation(let module, let submodule, let language, let copy):
            return (module, submodule, language, copy)
        case .emptyCopy(let module, let submodule, let language, let copy):
            return (module, submodule, language, copy)
        case .missingLanguageCopy(let module, let submodule, let language, let copy):
            return (module, submodule, language, copy)
        }
    }
}

public struct Linter {

    let module: Module
    let submodule: Submodule

    public init(module: Module, submodule: Submodule) {
        self.module = module
        self.submodule = submodule
    }

    public func lint() -> [LintError] {
        let copies = getCopies()
        var anomalies: [LintError] = []

        copies.forEach({ (copy) in
            let languageCopies = getCopiesForAllLanguages(initialCopy: copy)
            anomalies.append(contentsOf: checkCopyCreatedForAllLanguages(initialCopy: copy, languageAndCopy: languageCopies))

            languageCopies.forEach { (parentTuple) in
                if let emptyError = checkCopyIsNotEmpty(initialCopy: copy, language: parentTuple.language, copy: parentTuple.copy) {
                    anomalies.append(emptyError)
                }

                anomalies.append(contentsOf: languageContents(initialCopy: copy, currentLanguageAndCopy: parentTuple, languageAndCopy: getCopiesForAllLanguages(initialCopy: copy)))
            }
        })

        return anomalies
    }
}

private extension Linter {

    func getCopies() -> [Copy] {
        return submodule.language.first?.copy ?? []
    }

    func getCopiesForAllLanguages(initialCopy: Copy) -> [(language: Language, copy: Copy?)] {
        return submodule.language.compactMap { (language) -> (language: Language, copy: Copy?) in
            return (language, language.copy.first(where: { (languageCopy) -> Bool in
                return languageCopy.key == initialCopy.key
            }))
        }
    }

    func checkCopyCreatedForAllLanguages(initialCopy: Copy, languageAndCopy: [(language: Language, copy: Copy?)]) -> [LintError] {
        var anomalies: [LintError] = []

        languageAndCopy.forEach { (tuple) in
            if tuple.copy == nil {
                anomalies.append(.missingLanguageCopy(module: module, submodule: submodule, language: tuple.language, copy: initialCopy))
            }
        }
        return anomalies
    }

    func checkCopyIsNotEmpty(initialCopy: Copy, language: Language, copy: Copy?) -> LintError? {
        if copy?.value.value.isEmpty == true {
            return .emptyCopy(module: module, submodule: submodule, language: language, copy: initialCopy)
        }

        return nil
    }

    func languageContents(initialCopy: Copy, currentLanguageAndCopy: (language: Language, copy: Copy?), languageAndCopy: [(language: Language, copy: Copy?)]) -> [LintError] {
        var anomalies: [LintError] = []

        languageAndCopy.forEach { (tuple) in
            if tuple.language.identifier == currentLanguageAndCopy.language.identifier {
                return
            }

            if let emptyError = checkCopyIsNotEmpty(initialCopy: initialCopy, language: tuple.language, copy: tuple.copy) {
                anomalies.append(emptyError)
            }

            anomalies.append(contentsOf: isCopyContentEqual(language: currentLanguageAndCopy.language, initialCopy: initialCopy, copy1: currentLanguageAndCopy.copy, copy2: tuple.copy))
        }

        return anomalies
    }

    func isCopyContentEqual(language: Language, initialCopy: Copy, copy1: Copy?, copy2: Copy?) -> [LintError] {
        guard let value1 = copy1?.value,
            let value2 = copy2?.value else {
            return []
        }

        if value1.value == value2.value {
            return checkVariantsValue(language: language, copy: initialCopy, value1: value1, value2: value2)
        }

        return []
    }

    func checkVariantsValue(language: Language, copy: Copy, value1: Value, value2: Value) -> [LintError] {
        var anomalies: [LintError] = []

        guard let parameters1 = value1.parameters,
            let parameters2 = value2.parameters else {
                anomalies.append(.duplicatedCopyTranslation(module: module, submodule: submodule, language: language, copy: copy))
                return anomalies
        }

        let filteredParameters1 = parameters1.filter { (parameter) -> Bool in
            return parameter.type == .integer
        }

        let filteredParameters2 = parameters2.filter { (parameter) -> Bool in
            return parameter.type == .integer
        }

        filteredParameters1.forEach { (parameter1) in
            guard let parameter2 = filteredParameters2.first(where: { (param) -> Bool in
                return param.name == parameter1.name
            }) else {
                return
            }

            parameter1.variants.forEach { (variant1) in
                parameter2.variants.forEach { (variant2) in
                    if variant1.variant == variant2.variant {
                        anomalies.append(.duplicatedCopyTranslation(module: module, submodule: submodule, language: language, copy: copy))
                    }
                }
            }
        }
        return anomalies
    }
}
