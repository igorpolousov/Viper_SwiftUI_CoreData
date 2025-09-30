//
//  TasksClient.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 29.09.2025.
//

import Foundation

actor TasksClient {
    
    // NSCashe optional for client
    
    var tasks: [Todo] {
        get async throws {
            let data = try await downLoader.httpData(from: feedURL)
            let allTasks = try decoder.decode(TaskJSON.self, from: data)
            let tasks = allTasks.todos
            return tasks
        }
    }
    
    private let downLoader: any HTTPDataDownloader
    private let feedURL: URL = URL(string: "https://dummyjson.com/todos")!
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    init(downLoader: any HTTPDataDownloader = URLSession.shared) {
        self.downLoader = downLoader
    }
    
}
