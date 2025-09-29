//
//  AppErrors.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 29.09.2025.
//

import Foundation

enum ErrorHandler: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}


extension ErrorHandler: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return "Missing valid data"
        case .networkError:
            return "Network error"
        case .unexpectedError(error: let error):
            return "Unexpected error \(error.localizedDescription)"
        }
    }
}
