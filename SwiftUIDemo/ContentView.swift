//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("fontSize") private var fontSize = 16.0
    @AppStorage("selectedTheme") private var selectedTheme = AppTheme.system
    
    func theme() -> ColorScheme? {
        switch selectedTheme {
            case .dark:
                return ColorScheme.dark
            case .light:
                return ColorScheme.light
            default:
                return nil
        }
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!").font(.system(size: fontSize))
            AdvancedSettingsButton()
        }
        .padding()
        .preferredColorScheme(theme())
    }
}

#Preview {
    ContentView().frame(width: 500, height: 300)
}
