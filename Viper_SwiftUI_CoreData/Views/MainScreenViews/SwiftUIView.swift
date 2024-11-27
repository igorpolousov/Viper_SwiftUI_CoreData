//
//  SwiftUIView.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 25.11.2024.
//

import SwiftUI

struct SwiftUIView: View {
    
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("Hello, World!")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Title")
                
        }
        
    }
    
}

#Preview {
    SwiftUIView()
}
