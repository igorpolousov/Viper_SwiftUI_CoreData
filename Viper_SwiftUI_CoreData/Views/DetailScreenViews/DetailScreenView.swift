//
//  DetailScreenCiew.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 25.11.2024.
//

import SwiftUI

struct DetailScreenView: View {
        
    @State private var taskDescription: String = ""
    @EnvironmentObject var tasksMockData: TasksMockData
    @State var taskIndex: Int?
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                HStack {
                    Text(tasksMockData.tasksMockData[taskIndex ?? 0].taskName)
                        .font(Font.headerFont)
                        .foregroundStyle(Color.white)
                    Spacer()
                }
                HStack {
                    Text("\(tasksMockData.tasksMockData[taskIndex ?? 0].taskDate.formatted(date: .numeric, time: .omitted))")
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
            taskDescription = tasksMockData.tasksMockData[taskIndex ?? 0].taskDescription
        }
    }
}

#Preview {
    //@Previewable @State var taskDescription: String = ""
    DetailScreenView(taskIndex: 0)
        .environmentObject(TasksMockData())
}
