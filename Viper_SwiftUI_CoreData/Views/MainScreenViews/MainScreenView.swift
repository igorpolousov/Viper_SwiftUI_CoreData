//
//  ContentView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var searchText: String = ""
    @State var taskDescription: String = "Description"
    @State var taskName: String = ""
    
    @EnvironmentObject var tasksMockData: TasksMockData
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(tasksMockData.tasksMockData, id: \.self) { task in
                        ZStack {
                            NavigationLink(destination: DetailScreenView(taskName: "", date: Date.now, taskDescription: $taskDescription)) {}
                                .buttonStyle(.plain)
                                .opacity(0.0)
                                .frame(height: 0)
                            
                            TaskListRowView(taskName: task.taskName, taskDescription: task.taskDescription, taskCreationDate: Date.now, taskCompleted: false)
                            
                        }
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                }
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
