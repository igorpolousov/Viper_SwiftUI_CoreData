//
//  TaskModel.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import Foundation

struct TaskJSON: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case todos
    }
    
    private(set) var tasks: [Task] = []
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        if let task = try? container.decode(Task.self, forKey: .todos) {
            tasks.append(task)
        }
    }
}

// todos:[{id, todo, completed, userId}]
