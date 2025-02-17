//
//  AdvancedSettingsButton.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 1/31/25.
//

import SwiftUI

struct AdvancedSettingsButton: View {
    //
    @AppStorage("selectedSettingsTab") private var selectedSettingsTab = SettingsTab.general
    //
    @Environment(\.openSettings) private var openSettings
    //
    var body: some View {
        Button("Open Advanced Settings...") {
            selectedSettingsTab = .advanced
            openSettings()
        }
    }
}

#Preview("Advanced Settings Button") {
    AdvancedSettingsButton()
}
