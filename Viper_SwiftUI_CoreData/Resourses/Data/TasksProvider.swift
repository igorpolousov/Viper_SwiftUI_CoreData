//
//  TasksMockData.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import Foundation
import Combine
import CoreData

@MainActor
 class TasksProvider: ObservableObject {
     
     // Create Core Data stack
     let coreDataStack = CoreDataStack(modelName: "Viper_SwiftUI_CoreData")
     
     let client: TasksClient
    
    @Published var tasks: [TaskModel] = []

    @Published var searchText: String = ""
    @Published var filteredTasks: [TaskModel] = []
     
     func fetchTasks() async throws {
         let latestTasks = try await client.tasks
         // Todos -> TaskModel
         for task in latestTasks {
             createNewTask(taskName: task.todo, isCompleted: task.completed)
         }
     }
     
     // Read tasks from core data
      func readTasks() {
         let fetchRequest: NSFetchRequest<TaskModel> = TaskModel.fetchRequest()
         var asyncFetchRequest: NSAsynchronousFetchRequest<TaskModel>?
          asyncFetchRequest = NSAsynchronousFetchRequest<TaskModel>(fetchRequest: fetchRequest) {[weak self]
             (result: NSAsynchronousFetchResult) in
             guard let fetchResult = result.finalResult else {return}
             self?.tasks = fetchResult
         }
         
         do {
             guard let asyncFetchRequest = asyncFetchRequest else {return}
             try coreDataStack.managedContext.execute(asyncFetchRequest)
         } catch let error as NSError {
             print("Unalble to load data \(error), \(error.localizedDescription)")
         }
     }
     
     // Create new task
     func createNewTask(taskName: String = "New task", taskDescription: String = "Add description", isCompleted: Bool = false) {
         //let task = TaskModel(id: UUID(), taskName: taskName, taskDescription: taskDescription, taskDate: Date.now, isCompleted: false)
         let task = TaskModel(context: coreDataStack.managedContext)
         //task.id = id
         //task.userId = userId
         task.id = UUID()
         task.taskName = taskName
         task.taskDescription = taskDescription
         task.taskDate = Date.now
         task.isCompleted = isCompleted
         tasks.append(task)
         coreDataStack.saveContext()
     }
     
     // Update task
     func updateTask(at index: Int, taskName: String, taskDescription: String) {
         let tripToUpdate = tasks[index]
         tripToUpdate.taskName = taskName
         tripToUpdate.taskDescription = taskDescription
         tasks[index] = tripToUpdate
         coreDataStack.saveContext()
     }
     
     // Delete task by Index
     func deleteTask(at index: Int) {
         let taskToRemove = tasks[index]
         coreDataStack.managedContext.delete(taskToRemove)
         coreDataStack.saveContext()
         tasks.remove(at: index)
     }
     
     // Init
     init(client: TasksClient = TasksClient()) {
        self.client = client
        addSubscribers()
        readTasks()
    }
     
     // Searchinig in tasks
    private var cancellables = Set<AnyCancellable>()
    
    var isSeaching: Bool {
        !searchText.isEmpty
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
        
        filteredTasks = tasks.filter({ task in
            let search = seachText.lowercased()
            let taskNameContainsSearch = task.taskName.lowercased().contains(search)
            let taskDescriptionContainsSearch = task.taskDescription.lowercased().contains(search)
            return taskNameContainsSearch || taskDescriptionContainsSearch
        })
    }
    
   
    
}
