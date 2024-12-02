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
            .toolbarBackground(.visible)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        
                        Spacer(minLength: 150)
                        
                        Text("\(TasksMockData.tasksMockData.count) Tasks")
                            .foregroundStyle(Color.accentColor)
                        
                        Spacer()
                        
                        Button {
                            print("Go to detail veiw")
                        } label: {
                            Image("newTask")
                        }
                    }
                }
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .bottomBar)
            .searchable(text: $searchText)
        }
    }
}


#Preview {
    MainScreenView()
}
