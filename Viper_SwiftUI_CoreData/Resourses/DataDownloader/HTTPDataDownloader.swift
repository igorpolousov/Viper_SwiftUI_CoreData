//
//  HTTPDataDownloader.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 29.09.2025.
//

import Foundation

let validStatus = 200...299

protocol HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    
    func httpData(from url: URL) async throws -> Data {
        guard let (data,response) = try await self.data(from: url, delegate: nil) as? (Data, HTTPURLResponse), validStatus.contains(response.statusCode) else { throw ErrorHandler.networkError }
        return data
    }
    
    
}
