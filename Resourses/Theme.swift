//
//  Theme.swift
//  Viper_SwiftUI_CoreData
//
//  Created by Igor Polousov on 22.11.2024.
//

import SwiftUI

extension Font {
    public static let mainFont: Font = (Font.custom("SF-Pro", size: 24))
    public static let secondaryFont: Font = (Font.custom("SFProText", size: 22))
    
}

extension Color {
    public static let themeAccent: Color = Color("AccentColor")
    public static let taskCircleColor: Color = Color("TaskCircleColor")
}


import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    
    case light
    case dark
    
    var accentColor: Color {
        switch self {
        case .light:
            return .accentColor
        case .dark:
            return .accentColor
        }
    }
    
    var mainColor: Color {
        switch self {
        case .light:
            return .black
        case .dark:
            return .white
        }
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
