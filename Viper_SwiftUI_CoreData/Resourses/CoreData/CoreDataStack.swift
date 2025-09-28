//
//  CoreDataStack.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 28.09.2025.
//

import Foundation
import CoreData

class CoreDataStack: ObservableObject {
    
    private let modelName: String
     
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let conteiner = NSPersistentContainer(name: modelName)
        conteiner.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                print("Error to load stores: \(error), \(error.localizedDescription)")
            }
        }
        return conteiner
    }()
    
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unable to save context: \(error), \(error.localizedDescription)")
        }
    }
    
}
