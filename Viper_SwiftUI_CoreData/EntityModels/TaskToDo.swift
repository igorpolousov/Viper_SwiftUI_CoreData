//
//  Task.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 29.09.2025.
//

import Foundation

struct TaskToDo: Identifiable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}

extension TaskToDo: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case todo
        case completed
        case userID
    }
    
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawId = try? values.decode(Int.self, forKey: .id)
        let rawTodo = try? values.decodeIfPresent(String.self, forKey: .todo)
        let rawCompleted = try? values.decodeIfPresent(Bool.self, forKey: .completed)
        let rawUserId = try? values.decodeIfPresent(Int.self, forKey: .userID)
        
        guard   let id = rawId,
                let todo = rawTodo,
                let completed = rawCompleted,
                let userId = rawUserId
        else { throw ErrorHandler.missingData}
        
        self.id = id
        self.todo = todo
        self.completed = completed
        self.userId = userId
    }
}
