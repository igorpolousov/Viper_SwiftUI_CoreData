//
//  TaskListRowView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI

struct TaskListRowView: View {
    
    @State private var taskName: String = "Task name"
    @State private var taskDescription: String = "Task description"
    @State private var taskDate: Date = Date.now
    @State var taskIndex: Int?
    
    @State var task: TaskModel?
    
    @State var taskCompleted: Bool = false
    @EnvironmentObject var tasksData: TasksProvider
    @State private var isShowDetailView: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Button(action: {taskCompleted.toggle()}, label: {
                    if taskCompleted {
                        ZStack {
                            Image("circleYellow")
                            Image("tick")
                        }
                    } else {
                        Image("circleGray")
                            .clipped()
                    }
                })
                
                Text(task!.taskName)
                    .opacity(0.5)
                    .font(Font.mainFont)
                    .strikethrough(taskCompleted)
                    .foregroundStyle(Color.white)
                    .contextMenu {
                        Button("Редактировать", image: ImageResource(name: "edit", bundle: .main)) {
                            isShowDetailView.toggle()
                        }
                        
                        ShareLink(item: taskName) {
                            Label("Поделиться", image: "export")
                        }
                        
                        Button("Удалить", image: ImageResource(name: "trash", bundle: .main), role: .destructive) {
                            if let index = tasksData.tasks.firstIndex(of: task!) {
                                tasksData.deleteTask(at: index)
                            }
                        }
                    }
                Spacer()
            }
            
            HStack {
                VStack{}.frame(width: 25)
                VStack(alignment: .leading) {
                    
                    Text(task!.taskDescription)
                        .opacity(taskCompleted ? 0.5 : 1)
                        .font(Font.secondaryFont)
                    
                    Text(String(taskDate.formatted(date: .numeric, time: .omitted)))
                        .opacity(taskCompleted ? 0.5 : 1)
                        .font(Font.secondaryFont)
                }
            }
            .foregroundStyle(Color.white)
            
            Spacer()
        }
        .frame(height: 106)
        .background(Color.black)
        .sheet(isPresented: $isShowDetailView) {
            DetailScreenView(taskIndex: taskIndex, showDoneButton: true)
        }
    }
}



#Preview {
    TaskListRowView(taskIndex: 0)
}
