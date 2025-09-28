//
//  TasksMockData.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import Foundation
import Combine


 class TasksData: ObservableObject {
    
    @Published var allTasks: [TaskModel] = [
        TaskModel(id: UUID(), taskName: "First step", taskDescription: "View", taskDate: Date.now + 1, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Second step", taskDescription: "Interactor", taskDate: Date.now + 2, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Third step", taskDescription: "Presenter", taskDate: Date.now + 3, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Forth step", taskDescription: "Entity", taskDate: Date.now + 4, isCompleted: false),
        TaskModel(id: UUID(), taskName: "Fifth step", taskDescription: "Router", taskDate: Date.now + 5, isCompleted: false)
    ]
    
    @Published var searchText: String = ""
    @Published var filteredTasks: [TaskModel] = []
     
     // Create new task
     func createNewTask(taskName: String = "New task", taskDescription: String = "Add description") {
         let task = TaskModel(id: UUID(), taskName: taskName, taskDescription: taskDescription, taskDate: Date.now, isCompleted: false)
         
         allTasks.append(task)
     }
     
     // Update task
     func updateTask(at index: Int, taskName: String, taskDescription: String) {
         allTasks[index].taskName = taskName
         allTasks[index].taskDescription = taskDescription
     }
     
     
     
     // Delete task by Index
     func deleteTask(at index: Int) {
         allTasks.remove(at: index)
     }
     
    private var cancellables = Set<AnyCancellable>()
    
    var isSeaching: Bool {
        !searchText.isEmpty
    }
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.filteredTasks(seachText: searchText)
            }
            .store(in: &cancellables)

    }
    
    private func filteredTasks(seachText: String) {
        guard !seachText.isEmpty  else {
            filteredTasks = []
            return
        }
        
        filteredTasks = allTasks.filter({ task in
            let search = seachText.lowercased()
            let taskNameContainsSearch = task.taskName.lowercased().contains(search)
            let taskDescriptionContainsSearch = task.taskDescription.lowercased().contains(search)
            return taskNameContainsSearch || taskDescriptionContainsSearch
        })
    }
    
   
    
}
