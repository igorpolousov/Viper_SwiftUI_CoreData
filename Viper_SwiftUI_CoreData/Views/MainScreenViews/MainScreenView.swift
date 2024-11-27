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
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(alignment: .leading){
                    List {
                        ForEach(TasksMockData.tasksMockData) { task in
                            TaskListRowView(taskTitle: task.taskName, taskDescription: task.taskDescription)
                                .listRowInsets(.init(top: 0,
                                                     leading: 0,
                                                     bottom: 0,
                                                     trailing: 0))
                        }
                        .listRowBackground(Color.red)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                    .background(Color.black)
                }
                .navigationTitle("Tasks")
                .toolbarBackground(.visible)
                .toolbarColorScheme(.dark, for: .navigationBar)
            }
        }
    }
}


#Preview {
    MainScreenView()
}
