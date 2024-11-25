//
//  TaskModel.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import Foundation


struct TaskModel: Identifiable, Codable, Hashable {
    
    var id: UUID
    var taskName: String
    var taskDescription: String
    var dateCreated: Date
    var isCompleted: Bool
    
}
