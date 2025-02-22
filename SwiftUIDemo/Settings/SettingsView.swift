//
//  SettingsView.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 1/30/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("selectedSettingsTab") private var selectedSettingsTab = SettingsTab.general
    @AppStorage("selectedTheme") private var selectedTheme = AppTheme.system
    
    var body: some View {
        TabView(selection: $selectedSettingsTab) {
            Tab("General", systemImage: "gear", value: .general) {
                GeneralSetting()
            }
            Tab("Advanced", systemImage: "star", value: .advanced) {
                AdvancedSetting()
            }
        }.preferredColorScheme(theme(selectedTheme: selectedTheme))
    }
}

/// Settings Tab
enum SettingsTab: Int {
    case general
    case advanced
}


#Preview {
    SettingsView().frame(width: 500, height: 200)
}
