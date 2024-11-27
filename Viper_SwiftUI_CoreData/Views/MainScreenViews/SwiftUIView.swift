//
//  SwiftUIView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 25.11.2024.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State private var searchText: String = ""
    @State var taskDescription: String = ""
    
    @State var tasksData = TasksMockData()
    
    var body: some View {
        ZStack{
            NavigationView {
                VStack {
                    List {
                        ForEach(TasksMockData.tasksMockData) { task in
                            ZStack {
                                NavigationLink(destination: DetailScreenView( taskDescription: $taskDescription)) {}
                                    .buttonStyle(.plain)
                                    .opacity(0.0)
                                    .frame(height: 0)
                                
                                TaskListRowView(taskTitle: task.taskName, taskDescription: taskDescription)

                            }
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
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
