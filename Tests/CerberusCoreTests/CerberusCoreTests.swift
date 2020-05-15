import XCTest
@testable import CerberusCore

final class CerberusCoreTests: XCTestCase {

    static var allTests = [
        ("Module Parsing", testModuleParsing),
        ("Submodule Parsing", testSubmoduleParsing),
        ("Copy Parsing", testCopyParsing),
        ("Copy Plural Parsing", testCopyPluralParsing),
        ("Variant Parsing", testVariantParsing),
        ("Bad Variant Parsing", testBadVariantParsing),
        ("Parameter Parsing", testParameterParsing),
        ("Bad Parameter Parsing", testBadParameterParsing),
        ("Language Parsing", testLanguageParsing),
        ("Bad Language Parsing", testBadLanguageParsing),
    ]
}

extension CerberusCoreTests {

    func testModuleParsing() {
        let data = MockProvider.mock(type: .module)
        let decoded = JSONParser.decode(Module.self, from: data)
        XCTAssertNotNil(decoded)
    }

    func testSubmoduleParsing() {
        let data = MockProvider.mock(type: .submodule)
        let decoded = JSONParser.decode(Submodule.self, from: data)
        XCTAssertNotNil(decoded)
    }

    func testCopyParsing() {
        let data = MockProvider.mock(type: .copy)
        let decoded = JSONParser.decode(Copy.self, from: data)
        XCTAssertNotNil(decoded)
    }

    func testCopyPluralParsing() {
        let data = MockProvider.mock(type: .copyPlural)
        let decoded = JSONParser.decode(Copy.self, from: data)
        XCTAssertNotNil(decoded)
    }

    func testVariantParsing() {
        let data = MockProvider.mock(type: .variant)
        let decoded = JSONParser.decode(Variant.self, from: data)
        XCTAssertNotNil(decoded)
    }

    func testBadVariantParsing() {
        let data = MockProvider.mock(type: .badVariant)
        let decoded = JSONParser.decode(Variant.self, from: data)
        XCTAssertNil(decoded)
    }

    func testParameterParsing() {
        let data = MockProvider.mock(type: .parameter)
        let decoded = JSONParser.decode(Parameter.self, from: data)
        XCTAssertNotNil(decoded)
    }

    func testBadParameterParsing() {
        let data = MockProvider.mock(type: .badParameter)
        let decoded = JSONParser.decode(Parameter.self, from: data)
        XCTAssertNil(decoded)
    }

    func testLanguageParsing() {
        let data = MockProvider.mock(type: .language)
        let decoded = JSONParser.decode(Language.self, from: data)
        XCTAssertNotNil(decoded)
    }

    func testBadLanguageParsing() {
        let data = MockProvider.mock(type: .badLanguage)
        let decoded = JSONParser.decode(Language.self, from: data)
        XCTAssertNil(decoded)
    }
}
