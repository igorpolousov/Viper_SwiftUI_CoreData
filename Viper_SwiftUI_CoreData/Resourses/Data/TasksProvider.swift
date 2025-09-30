//
//  TasksMockData.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import Foundation
import Combine
import CoreData


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
         DispatchQueue.global(qos: .background).async {
             for task in latestTasks {
                 self.createNewTask(taskName: task.todo, isCompleted: task.completed)
             }
         }
     }
     
     // Read tasks from core data
      func readTasks() {
          DispatchQueue.global(qos: .background).async {
              let fetchRequest: NSFetchRequest<TaskModel> = TaskModel.fetchRequest()
              var asyncFetchRequest: NSAsynchronousFetchRequest<TaskModel>?
               asyncFetchRequest = NSAsynchronousFetchRequest<TaskModel>(fetchRequest: fetchRequest) { [weak self]
                  (result: NSAsynchronousFetchResult) in
                  guard let fetchResult = result.finalResult else {return}
                   DispatchQueue.main.async {
                       self?.tasks = fetchResult
                   }
              }
              
              do {
                  guard let asyncFetchRequest = asyncFetchRequest else {return}
                  try self.coreDataStack.managedContext.execute(asyncFetchRequest)
              } catch let error as NSError {
                  print("Unalble to load data \(error), \(error.localizedDescription)")
              }
          }
       
     }
     
     // Create new task
     func createNewTask(taskName: String = "New task", taskDescription: String = "Add description", isCompleted: Bool = false) {
         DispatchQueue.global(qos: .background).async { 
             let task = TaskModel(context: self.coreDataStack.managedContext)
             task.id = UUID()
             task.taskName = taskName
             task.taskDescription = taskDescription
             task.taskDate = Date.now
             task.isCompleted = isCompleted
             DispatchQueue.main.async {
                 self.tasks.append(task)
             }
             self.coreDataStack.saveContext()
         }
        
     }
     
     // Update task
     func updateTask(at index: Int, taskName: String, taskDescription: String) {
         DispatchQueue.global(qos: .background).async {
             let tripToUpdate = self.tasks[index]
             tripToUpdate.taskName = taskName
             tripToUpdate.taskDescription = taskDescription
             print(Thread.current)
             DispatchQueue.main.async {
                 self.tasks[index] = tripToUpdate
                 print(Thread.current)
             }
             self.coreDataStack.saveContext()
         }
     }
     
     // Delete task by Index
     func deleteTask(at index: Int) {
         DispatchQueue.global(qos: .background).async {
             let taskToRemove = self.tasks[index]
             self.coreDataStack.managedContext.delete(taskToRemove)
             self.coreDataStack.saveContext()
             DispatchQueue.main.async {
                 self.tasks.remove(at: index)
                 if let index = self.filteredTasks.firstIndex(of: taskToRemove) {
                     self.filteredTasks.remove(at: index)
                 }
             }
         }
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
        DispatchQueue.global(qos: .background).async {
            guard !seachText.isEmpty  else {
                DispatchQueue.main.async {
                    self.filteredTasks = []
                }
                return
            }
            
           let filteredResult = self.tasks.filter({ task in
                let search = seachText.lowercased()
                let taskNameContainsSearch = task.taskName.lowercased().contains(search)
                let taskDescriptionContainsSearch = task.taskDescription.lowercased().contains(search)
                return taskNameContainsSearch || taskDescriptionContainsSearch
            })
            
            DispatchQueue.main.async {
                self.filteredTasks = filteredResult
            }
        }
        
    }
    
   
    
}
