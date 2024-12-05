//
//  TasksMockData.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import Foundation


class TasksMockData: ObservableObject {
    @Published var tasksMockData: [TaskModel] = [
        TaskModel(id: UUID(), taskName: "First step", taskDescription: "View", taskDate: Date.now + 1, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Second step", taskDescription: "Interactor", taskDate: Date.now + 2, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Third step", taskDescription: "Presenter", taskDate: Date.now + 3, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Forth step", taskDescription: "Entity", taskDate: Date.now + 4, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Fifth step", taskDescription: "Router", taskDate: Date.now + 5, isCompleted: false)
    ]
}
