//
//  TaskModel.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import Foundation

struct Todos: Decodable {
    var todos: [Todo]
}

struct Todo: Decodable {
    var id,userId: Double
    var completed: Bool
    var todo: String
    
}

struct TaskJSON: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case todos
    }
    
    private(set) var tasks: [TaskToDo] = []
    private(set) var todos: [Todo] = []
    
    init(from decoder: any Decoder) throws {
        let decoder1 = JSONDecoder()
        if let data = try? Data(contentsOf: URL(string: "https://dummyjson.com/todos")!) {
            if let result = try? decoder1.decode(Todos.self, from: data) {
                todos = result.todos
            }
        }
    }
}

// todos:[{id, todo, completed, userId}]
