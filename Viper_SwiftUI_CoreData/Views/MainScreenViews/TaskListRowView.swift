//
//  TaskListRowView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI

struct TaskListRowView: View {
    
     var taskName: String = "Task name"
     var taskDescription: String = "Task description"
     var taskDate: Date = Date.now
     var taskIndex: Int?
    
    @State var taskCompleted: Bool = false
    @EnvironmentObject var tasksMockData: TasksData
    
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
               
                if taskCompleted {
                    Text(taskName)
                        .opacity(0.5)
                        .font(Font.mainFont)
                        .strikethrough()
                        .foregroundStyle(Color.white)
                        .contextMenu {
                            Button {
                                print("Переход на DetailScreenView")
                            } label: {
                                Label("Редактировать", image: "edit")
                            }
                            
                            Button {
                                print("Переход на DetailScreenView")
                            } label: {
                                Label("Поделиться", image: "export")
                            }
                            
                            Button(role: .destructive) {
                                print("Удалить задачу")
                                tasksMockData.deleteTask(at: taskIndex!)
                                print("Задача удалена")
                            } label: {
                                Label("Удалить", image: "trash")
                            }
                        }
                } else {
                    Text(taskName)
                        .font(Font.mainFont)
                        .foregroundStyle(Color.white)
                        .contextMenu {
                            Button {
                                print("Переход на DetailScreenView")
                            } label: {
                                Label("Редактировать", image: "edit")
                            }
                            
                            Button {
                                print("Переход на DetailScreenView")
                            } label: {
                                Label("Поделиться", image: "export")
                            }
                            
                            Button(role: .destructive) {
                                print("Удалить задачу")
                                tasksMockData.deleteTask(at: taskIndex!)
                                print("Задача удалена")
                            } label: {
                                Label("Удалить", image: "trash") 
                            }

                        }
                        
                }
                Spacer()
            }
            
            HStack {
                VStack{}.frame(width: 25)
                VStack(alignment: .leading) {
                    if taskCompleted {
                        Text(taskDescription)
                            .opacity(0.5)
                            .font(Font.secondaryFont)
                            
                        Text(String(taskDate.formatted(date: .numeric, time: .omitted)))
                            .opacity(0.5)
                            .font(Font.secondaryFont)

                    } else {
                        
                        Text(taskDescription)
                            .font(Font.secondaryFont)
                        Text(String(taskDate.formatted(date: .numeric, time: .omitted)))
                            .font(Font.secondaryFont)
                        
                    }
                }
            }
            .foregroundStyle(Color.white)
          
            Spacer()
        }
        .frame(height: 106)
        .background(Color.black)
    }
}



#Preview {
    TaskListRowView()
}
