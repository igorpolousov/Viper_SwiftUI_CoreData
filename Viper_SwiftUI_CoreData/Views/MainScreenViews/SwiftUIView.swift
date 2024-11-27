//
//  SwiftUIView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 25.11.2024.
//

import SwiftUI

struct SwiftUIView: View {
    
    var body: some View {
     
        Button {
            print("Удалить задачу")
        } label: {
            Label("Удалить", image: "trash").foregroundStyle(.red)
        }
    }
}

#Preview {
    SwiftUIView()
}
