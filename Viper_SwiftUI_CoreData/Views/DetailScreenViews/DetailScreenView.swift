//
//  DetailScreenCiew.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 25.11.2024.
//

import SwiftUI

struct DetailScreenView: View {
    
    var taskName: String = "Task name"
    var date: Date = Date.now
    @Binding var taskDescription: String
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                HStack {
                    Text(taskName)
                        .font(Font.headerFont)
                        .foregroundStyle(Color.white)
                    Spacer()
                }
                HStack {
                    Text("\(date.formatted(date: .numeric, time: .omitted))")
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
        
    }
}

#Preview {
    @Previewable @State var description: String = "Hello description"
    DetailScreenView(taskDescription: $description)
}
