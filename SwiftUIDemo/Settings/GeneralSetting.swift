//
//  GeneralSetting.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/6/25.
//

import SwiftUI

struct GeneralSetting: View {
    @AppStorage("showPreview") private var showPreview = true
    @AppStorage("fontSize") private var fontSize = 16.0
    
    var body: some View {
        Form {
            Toggle("Show Previews", isOn: $showPreview)
            Slider(value: $fontSize, in: 9...96) {
                Text("Font size: ")
                Text("\(fontSize, specifier: "%2.0f")").font(.system(size: 16).monospaced())
                Text(" pts")
            }
            Divider()
            ThemePicker()
        }.padding()
    }
}

/// App Theme
enum AppTheme: String, CaseIterable {
    case light, dark, system
}

struct ThemePicker: View {
    @AppStorage("selectedTheme") private var selectedTheme = AppTheme.system
    
    var body: some View {
        Text("Current Theme: \(selectedTheme.rawValue)")
        Picker("Theme", selection: $selectedTheme) {
            ForEach(AppTheme.allCases, id: \.self) { theme in
                Text(theme.rawValue.capitalized)
            }
        }
        .fixedSize()
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
    GeneralSetting().frame(width: 500, height: 300)
}
