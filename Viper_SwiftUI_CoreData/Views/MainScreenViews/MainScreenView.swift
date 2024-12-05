//
//  ContentView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var searchText: String = ""
    
    @EnvironmentObject var tasksMockData: TasksMockData
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(tasksMockData.tasksMockData, id: \.self) { task in
                        let taskIndex = tasksMockData.tasksMockData.firstIndex(of: task)
                        ZStack {
                            NavigationLink(destination: DetailScreenView(taskIndex: taskIndex)) {}
                                .buttonStyle(.plain)
                                .opacity(0.0)
                                .frame(height: 0)
                            
                            TaskListRowView(taskName: task.taskName, taskDescription: task.taskDescription, taskDate: task.taskDate, taskCompleted: false)
                            
                        }
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                }
                // buttonStyle allows TaskListRowView to work buttons correctly
                .buttonStyle(BorderlessButtonStyle())
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
                .background(Color.black)
                .navigationTitle("Tasks")
                .toolbarBackground(.visible)
                // Bottom toolbar
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            
                            Spacer(minLength: 150)
                            
                            // Tasks counter bottom toolbar
                            Text("\(tasksMockData.tasksMockData.count) Tasks")
                                .foregroundStyle(Color.accentColor)
                            
                            Spacer()
                            
                            // Creating new task button
                            Button {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    TaskFunctions.createNewTask(dataStorage: &tasksMockData.tasksMockData)
                                }
                            } label: {
                                Image("newTask")
                            }
                        }
                    }
                }
                // Style setup for bottom toolbar
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .bottomBar)
                .searchable(text: $searchText)
            }
        }
    }
}


#Preview {
    MainScreenView()
        .environmentObject(TasksMockData())
}
