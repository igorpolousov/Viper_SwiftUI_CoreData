//
//  DetailScreenCiew.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 25.11.2024.
//

import SwiftUI

struct DetailScreenView: View {
        
    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    @State private var taskDate: Date = Date.now
    
    @EnvironmentObject var tasksMockData: TasksMockData
    @State var taskIndex: Int?
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                HStack {
                    Text("\(taskName)")
                        .font(Font.headerFont)
                        .foregroundStyle(Color.white)
                    Spacer()
                }
                HStack {
                    Text("\(taskDate.formatted(date: .numeric, time: .omitted))")
                        .font(Font.secondaryFont)
                        .foregroundStyle(Color.white)
                        .opacity(0.5)
                    Spacer()
                }
                Spacer()
                
                TextEditor(text: $taskDescription)
                    .scrollContentBackground(.hidden)
                    .font(Font.mainFont)
                    .foregroundStyle(Color.white)
            }
        }
        .onAppear {
            taskName = tasksMockData.tasksMockData[taskIndex ?? 0].taskName
            taskDescription = tasksMockData.tasksMockData[taskIndex ?? 0].taskDescription
            taskDate = tasksMockData.tasksMockData[taskIndex ?? 0].taskDate
        }
    }
}

#Preview {
    //@Previewable @State var taskDescription: String = ""
    DetailScreenView(taskIndex: 0)
        .environmentObject(TasksMockData())
}
