//
//  TasksMockData.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import Foundation


class TasksMockData {
    static var tasksMockData: [TaskModel] = [
        TaskModel(id: UUID(), taskName: "First step", taskDescription: "View", dateCreated: Date.now + 1, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Second step", taskDescription: "Interactor", dateCreated: Date.now + 2, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Third step", taskDescription: "Presenter", dateCreated: Date.now + 3, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Forth step", taskDescription: "Entity", dateCreated: Date.now + 4, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Fifth step", taskDescription: "Router", dateCreated: Date.now + 5, isCompleted: false)
    ]
}
