//
//  TestDownloader.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 30.09.2025.
//

import Foundation

class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        return testTodosData
    }
    
    
}
