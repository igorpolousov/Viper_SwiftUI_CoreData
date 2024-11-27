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
                    Text(taskTitle)
                        .opacity(0.5)
                        .font(Font.mainFont)
                        .strikethrough()
                        .foregroundStyle(Color.white)
                } else {
                    Text(taskTitle)
                        .font(Font.mainFont)
                        .foregroundStyle(Color.white)
                        
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
                            
                        Text(String(taskCreationDate.formatted(date: .numeric, time: .omitted)))
                            .opacity(0.5)
                            .font(Font.secondaryFont)

                    } else {
                        
                        Text(taskDescription)
                            .font(Font.secondaryFont)
                        Text(String(taskCreationDate.formatted(date: .numeric, time: .omitted)))
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
