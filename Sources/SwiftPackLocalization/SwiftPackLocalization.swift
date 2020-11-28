//
//  ErrorFactory.swift
//
//
//  Created by Rostyslav Druzhchenko on 28.11.2020.
//

import Foundation

public class CustomError: Error {

    let code: Int
    let message: String

    public init(_ code: Int, _ message: String) {
        self.code = code
        self.message = message
    }
}

public class LanguageManager {

    static let shared = LanguageManager()

    public var language: String = "en"

    private init() {}
}

func L(_ key: String, _ language: String) -> String {
    let path = Bundle.module.path(forResource: language, ofType: "lproj")
    let bundle = Bundle(path: path!)
    return bundle!.localizedString(forKey: "ERR_MESSAGE_CONNECTION_LOST", value: nil, table: nil)
}

public class ErrorFactory {

    let language: String

    public init() {
        self.language = LanguageManager.shared.language
    }

    func error(for code: Int) -> CustomError {

        var message: String
        switch code {
        case 1:
            message = L("ERR_MESSAGE_CONNECTION_LOST", language)
        case 2:
            message = L("ERR_MESSAGE_TRNASACTION_FAILED", language)
        default:
            message = L("ERR_MESSAGE_UNKNOWN", language)
        }

        return CustomError(code, message)
    }
}
