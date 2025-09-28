//
//  ContentView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI
import Combine

struct MainScreenView: View {
    
    @EnvironmentObject var tasksData: TasksData
    
    var body: some View {
        ZStack {
            NavigationView {
                // Show list of available tasks
                List { // Consider to use Scroll view instead of List -> Make code easyer
                    ForEach(tasksData.isSeaching ? tasksData.filteredTasks : tasksData.allTasks, id: \.self) { task in
                        let taskIndex = tasksData.allTasks.firstIndex(of: task)
                        ZStack {
                            // Go to Task Details Screen for editing
                            NavigationLink(destination: DetailScreenView(taskIndex: taskIndex)) {}
                                .buttonStyle(.plain)
                                .opacity(0.0)
                                .frame(height: 0)
                            
                            TaskListRowView(taskName: task.taskName, taskDescription: task.taskDescription, taskDate: task.taskDate, taskIndex: taskIndex!, taskCompleted: false)
                            
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
                // Bottom toolbar: task counter + new task button
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            
                            Spacer(minLength: 150)
                            
                            // Tasks counter bottom toolbar
                            Text("\(tasksData.allTasks.count) Tasks")
                                .foregroundStyle(Color.accentColor)
                            
                            Spacer()
                            
                            // Creating new task button
                            Button {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    tasksData.createNewTask()
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
                .searchable(text: $tasksData.searchText, placement: .automatic, prompt: Text("Search in tasks"))
            }
        }
    }
}


#Preview {
    MainScreenView()
        .environmentObject(TasksData())
}
