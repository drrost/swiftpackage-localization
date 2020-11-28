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

func L(_ key: String) -> String {
    let language = LanguageManager.shared.language
    let path = Bundle.module.path(forResource: language, ofType: "lproj")
    let bundle = Bundle(path: path!)
    return bundle!.localizedString(
        forKey: "ERR_MESSAGE_CONNECTION_LOST", value: nil, table: nil)
}

public class ErrorFactory {

    public init() {}

    func error(for code: Int) -> CustomError {

        var message: String
        switch code {
        case 1:
            message = L("ERR_MESSAGE_CONNECTION_LOST")
        case 2:
            message = L("ERR_MESSAGE_TRNASACTION_FAILED")
        default:
            message = L("ERR_MESSAGE_UNKNOWN")
        }

        return CustomError(code, message)
    }
}
