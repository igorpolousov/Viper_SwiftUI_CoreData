//
//  ContentView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(TasksMockData.tasksMockData) { task in
                    TaskListRowView(taskTitle: task.taskName, taskDescription: task.taskDescription)
                }
                .listRowBackground(Color.clear)
            }
            
            .foregroundStyle(.white)
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .navigationTitle("Tasks")
            .background(Color.black)
        }
    }
}



#Preview {
    MainScreenView()
}
