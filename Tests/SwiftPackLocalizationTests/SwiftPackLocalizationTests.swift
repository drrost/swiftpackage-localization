//
//  SwiftPackLocalization.swift
//
//
//  Created by Rostyslav Druzhchenko on 28.11.2020.
//

import XCTest

@testable import SwiftPackLocalization

final class SwiftPackLocalizationTests: XCTestCase {

    func testConnectionLostEn() {
        // Given
        let code = 1
        LanguageManager.shared.language = "en"
        let errorFactory = ErrorFactory()

        // When
        let error = errorFactory.error(for: code)

        // Then
        XCTAssertEqual(1, error.code)
        XCTAssertEqual("Connection lost", error.message)
    }

    func testConnectionLostFr() {
        // Given
        let code = 1
        LanguageManager.shared.language = "fr"
        let errorFactory = ErrorFactory()

        // When
        let error = errorFactory.error(for: code)

        // Then
        XCTAssertEqual(1, error.code)
        XCTAssertEqual("Connexion perdue", error.message)
    }

}
