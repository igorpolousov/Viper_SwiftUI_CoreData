//
//  ContentView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var searchText: String = ""
    @State var taskDescription: String = ""
    
    @State var tasksData = TasksMockData()
    

    var body: some View {
        ZStack {
            NavigationView {
                VStack(alignment: .leading){
                    List {
                        ForEach(tasksData.tasksMockData) { task in
                            ZStack {
                                NavigationLink(destination: DetailScreenView()) {}
                                .buttonStyle(.plain)
                                .opacity(0.0)
                                .frame(height: 0)
                                
                                TaskListRowView(taskTitle: task.taskName, taskDescription: task.taskDescription)
                                 
                            }
                            .listRowBackground(Color.red)
                            .listRowInsets(.init(top: 0,
                                                   leading: 0,
                                                   bottom: 0,
                                                   trailing: 0))
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                    .background(Color.black)
                }
                .navigationTitle("Tasks")
                .toolbarBackground(.visible)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .searchable(text: $searchText)
            }
        }
    }
}


#Preview {
    MainScreenView()
}
