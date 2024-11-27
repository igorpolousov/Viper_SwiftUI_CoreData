//
//  DetailScreenCiew.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 25.11.2024.
//

import SwiftUI

struct DetailScreenView: View {
    
    var headerName: String = "Header name"
    var date: Date = Date.now
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                HStack {
                    Text(headerName)
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
            }
        }
        
    }
}

#Preview {
    DetailScreenView()
}
