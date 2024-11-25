//
//  ContentView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    //    init() {
    //        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    //    }

    @State private var taskIndex: Int = 0
    @State private var taskCompleted: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                List {
                    ForEach(TasksMockData.tasksMockData) { task in
                        TaskListRowView(taskTitle: task.taskName, taskDescription: task.taskDescription)
                            
                    }
                    
                }
                
                .buttonStyle(BorderlessButtonStyle())
                .listStyle(.insetGrouped)
            }
            
            .navigationTitle("Tasks")
        }
    }
}


#Preview {
    MainScreenView()
}
