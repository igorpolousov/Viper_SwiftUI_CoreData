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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(TasksMockData.tasksMockData) { task in
                    ZStack {
                        NavigationLink(destination: DetailScreenView( taskDescription: $taskDescription)) {}
                            .buttonStyle(.plain)
                            .opacity(0.0)
                            .frame(height: 0)
                        
                        TaskListRowView(taskTitle: task.taskName, taskDescription: taskDescription)
                           
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))

                }
            }
            .buttonStyle(BorderlessButtonStyle())
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .navigationTitle("Tasks")
            .toolbar {
               
                ToolbarItem(placement: .bottomBar) {
                    Text("\(TasksMockData.tasksMockData.count) Tasks").foregroundStyle(Color.themeAccent)
                    
                    Button {
                        print("show detail screen view")
                    }
                    label: {
                        Image("newTask")
                    }
                    
                }
                
                
            }
            .toolbarBackground(.visible)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .searchable(text: $searchText)
        }
        
    }
}


#Preview {
    MainScreenView()
}
