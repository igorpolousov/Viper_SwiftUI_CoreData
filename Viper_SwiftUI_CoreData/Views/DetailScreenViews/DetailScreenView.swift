//
//  DetailScreenCiew.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 25.11.2024.
//

import SwiftUI

struct DetailScreenView: View {
        
    // vars for showing data for task ans saving updates user made
    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    @State private var taskDate: Date = Date.now
    
    @EnvironmentObject var tasksMockData: TasksData
    @Environment(\.dismiss) var dismiss
    @State var taskIndex: Int?
    @State var showDoneButton: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            VStack {
                if showDoneButton {
                    HStack {
                        Spacer().frame(width: UIScreen.main.bounds.width - 100)
                        Button {
                            showDoneButton.toggle()
                            dismiss()
                        } label: {
                            Text("Готово")
                                .foregroundStyle(Color.accent)
                                .font(.headline)
                        }
                    }
                }
                HStack {
                    // Task name info
                 
                        TextEditor(text: $taskName)
                            .scrollContentBackground(.hidden)
                            .font(Font.headerFont)
                            .foregroundStyle(Color.white)
                            .frame(width: UIScreen.main.bounds.width, height: 52)
                        Spacer()
                     
                }
                HStack {
                    // Task date info
                    Text("\(taskDate.formatted(date: .numeric, time: .omitted))")
                        .font(Font.secondaryFont)
                        .foregroundStyle(Color.white)
                        .opacity(0.5)
                        .padding(.leading, 5)
                    Spacer()
                }
                Spacer()
                // Task description editor
                TextEditor(text: $taskDescription)
                    .scrollContentBackground(.hidden)
                    .font(Font.mainFont)
                    .foregroundStyle(Color.white)
            }
        }
        .onAppear {
            // Get data from Environment object
            let task = tasksMockData.allTasks[taskIndex ?? 0]
            taskName = task.taskName
            taskDescription = task.taskDescription
            taskDate = task.taskDate
        }
        .onDisappear {
            // update task data
            tasksMockData.updateTask(at: taskIndex!, taskName: taskName, taskDescription: taskDescription)
            dismiss()
        }
    }
}

#Preview {
    //@Previewable @State var taskDescription: String = ""
    DetailScreenView(taskIndex: 0)
        .environmentObject(TasksData())
}
