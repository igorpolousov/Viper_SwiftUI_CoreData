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
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.black)
                .frame(height: 50)
            
            HStack(alignment: .top) {
                
                Image(systemName: "circle").foregroundStyle(Color.white)
                
                VStack(alignment: .listRowSeparatorLeading) {
                    Text(taskTitle).font(Font.mainFont)
                    Text(taskDescription).font(Font.secondaryFont)
                    
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
