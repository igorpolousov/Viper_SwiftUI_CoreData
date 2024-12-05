//
//  Viper_SwiftUI_CoreDataApp.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI

@main
struct Viper_SwiftUI_CoreDataApp: App {
    
    // Data for List view
    var tasksMockData = TasksMockData()
    
    var body: some Scene {
        WindowGroup {
            MainScreenView()
                .environmentObject(tasksMockData)
        }
    }
}
