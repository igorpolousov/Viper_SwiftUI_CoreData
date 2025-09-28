//
//  TasksMockData.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import Foundation
import Combine
import CoreData


 class TasksData: ObservableObject {
     
     // Create Core Data stack
     let coreDataStack = CoreDataStack(modelName: "Viper_SwiftUI_CoreData")
    
    @Published var allTasks: [TaskModel] = [
//        TaskModel(id: UUID(), taskName: "First step", taskDescription: "View", taskDate: Date.now + 1, isCompleted: false),
//        TaskModel(id: UUID(), taskName: "Second step", taskDescription: "Interactor", taskDate: Date.now + 2, isCompleted: false),
//        TaskModel(id: UUID(), taskName: "Third step", taskDescription: "Presenter", taskDate: Date.now + 3, isCompleted: false),
//        TaskModel(id: UUID(), taskName: "Forth step", taskDescription: "Entity", taskDate: Date.now + 4, isCompleted: false),
//        TaskModel(id: UUID(), taskName: "Fifth step", taskDescription: "Router", taskDate: Date.now + 5, isCompleted: false)
    ]

    
    @Published var searchText: String = ""
    @Published var filteredTasks: [TaskModel] = []
     
     // Read tasks from core data
      func readTasks() {
         let fetchRequest: NSFetchRequest<TaskModel> = TaskModel.fetchRequest()
         var asyncFetchRequest: NSAsynchronousFetchRequest<TaskModel>?
          asyncFetchRequest = NSAsynchronousFetchRequest<TaskModel>(fetchRequest: fetchRequest) {[weak self]
             (result: NSAsynchronousFetchResult) in
             guard let fetchResult = result.finalResult else {return}
             self?.allTasks = fetchResult
         }
         
         do {
             guard let asyncFetchRequest = asyncFetchRequest else {return}
             try coreDataStack.managedContext.execute(asyncFetchRequest)
         } catch let error as NSError {
             print("Unalble to load data \(error), \(error.localizedDescription)")
         }
     }
     
     // Create new task
     func createNewTask(taskName: String = "New task", taskDescription: String = "Add description") {
         //let task = TaskModel(id: UUID(), taskName: taskName, taskDescription: taskDescription, taskDate: Date.now, isCompleted: false)
         let task = TaskModel(context: coreDataStack.managedContext)
         task.id = UUID()
         task.taskName = taskName
         task.taskDescription = taskDescription
         task.taskDate = Date.now
         task.isCompleted = false
         allTasks.append(task)
         coreDataStack.saveContext()
     }
     
     // Update task
     func updateTask(at index: Int, taskName: String, taskDescription: String) {
         let tripToUpdate = allTasks[index]
         tripToUpdate.taskName = taskName
         tripToUpdate.taskDescription = taskDescription
         allTasks[index] = tripToUpdate
         coreDataStack.saveContext()
     }
     
     // Delete task by Index
     func deleteTask(at index: Int) {
         let taskToRemove = allTasks[index]
         coreDataStack.managedContext.delete(taskToRemove)
         coreDataStack.saveContext()
         allTasks.remove(at: index)
     }
     
     // Searchinig in tasks
    private var cancellables = Set<AnyCancellable>()
    
    var isSeaching: Bool {
        !searchText.isEmpty
    }
    
    init() {
        addSubscribers()
        readTasks()
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
