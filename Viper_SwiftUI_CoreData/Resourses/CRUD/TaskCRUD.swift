//
//  TaskCRUD.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 02.12.2024.
//

import UIKit

class TaskFunctions {
    
    // Create new task
    static func createNewTask(id: UUID = UUID(), taskName: String = "New Task", taskDescription: String = "Add description", dateCreated: Date = Date.now, isCompleted: Bool = false, dataStorage: inout [TaskModel]) {
        let newTask = TaskModel(id: id, taskName: taskName, taskDescription: taskDescription, taskDate: dateCreated, isCompleted: isCompleted)
        dataStorage.append(newTask)
    }
    
    // Update task by index in storage (May be not safe consider to change by ID)
    
    static func updateTask(update_at index: Int, taskName: String, taskDescription: String, dataStorage: inout [TaskModel]) {
        dataStorage[index].taskName = taskName
        dataStorage[index].taskDescription = taskDescription
        
    }
    
    
}
