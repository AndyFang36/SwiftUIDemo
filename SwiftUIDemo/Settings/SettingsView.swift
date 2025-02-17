//
//  SettingsView.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 1/30/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("showPreview") private var showPreview = true
    @AppStorage("fontSize") private var fontSize = 16.0
    @AppStorage("selectedTheme") private var selectedTheme = AppTheme.system
    
    var body: some View {
        showPreview ? Text("Settings").font(.system(size: fontSize)) : Text("Settings")
        Form {
            Toggle("Show Previews", isOn: $showPreview)
            Slider(value: $fontSize, in: 9...96) {
                Text("Font size: \(fontSize, specifier: "%.0f") pts")
            }
            Divider()
            ThemeSettingsView()
        }.preferredColorScheme(theme(selectedTheme: selectedTheme))
    }
}

/// Settings Tab
enum SettingsTab: Int {
    case general
    case advanced
}

/// App Theme
enum AppTheme: String, CaseIterable {
    case light, dark, system
}

struct ThemeSettingsView: View {
    @AppStorage("selectedTheme") private var selectedTheme = AppTheme.system
    
    var body: some View {
        Text("Current Theme: \(selectedTheme.rawValue)")
        Picker("Theme", selection: $selectedTheme) {
            ForEach(AppTheme.allCases, id: \.self) { theme in
                Text(theme.rawValue.capitalized)
            }
        }
    }
}

func theme(selectedTheme: AppTheme) -> ColorScheme? {
    switch selectedTheme {
        case .dark:
            return ColorScheme.dark
        case .light:
            return ColorScheme.light
        default:
            return nil
    }
}

#Preview {
    SettingsView().frame(width: 500, height: 300)
}
