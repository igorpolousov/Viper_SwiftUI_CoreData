//
//  TaskListRowView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI

struct TaskListRowView: View {
    
    var taskTitle: String = "Task title"
    var taskDescription: String = "Task description"
    var taskCreationDate: Date = Date.now
    
    @State var taskCompleted: Bool = false
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.black)
                .frame(height:106)
            
            HStack(alignment: .top) {
                
                Button {
                    taskCompleted.toggle()
                } label: {
                    if taskCompleted {
                        ZStack {
                            Image("circleYellow")
                            Image("tick")
                        }.padding(.top, 12)
                    } else {
                        Image("circleGray").padding(.top, 12)
                    }
                }
                .frame(width: 24, height: 48)

                
                VStack(alignment: .listRowSeparatorLeading) {
                    if taskCompleted {
                        Text(taskTitle)
                            .opacity(0.5)
                            .font(Font.mainFont)
                            .padding(.top, 10)
                            .strikethrough()
                        Text(taskDescription)
                            .opacity(0.5)
                            .font(Font.secondaryFont)
                        Text(String(taskCreationDate.formatted(date: .numeric, time: .omitted)))
                            .opacity(0.5)
                            .font(Font.secondaryFont)

                    } else {
                        Text(taskTitle)
                            .font(Font.mainFont)
                            .padding(.top, 10)
                        Text(taskDescription)
                            .font(Font.secondaryFont)
                        Text(String(taskCreationDate.formatted(date: .numeric, time: .omitted)))
                            .font(Font.secondaryFont)
                        
                    }
                }
                .foregroundStyle(Color.white)
                Spacer()
            }
        }
    }
}

#Preview {
    TaskListRowView()
}
