//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 1/29/25.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 800, height: 500)
        .onChange(of: scenePhase) { _, phase in
            switch (phase) {
                case .active: print("active")
                case .background: print("background")
                case .inactive: print("inactive")
                @unknown default: break
            }
        }
        //
        Window("Help", id: "help") {
            HelpView()
        }
        .defaultSize(width: 400, height: 300)
        .keyboardShortcut("H")
        //
#if os(macOS)
        Settings {
            SettingsView().frame(minWidth: 300, minHeight: 200)
        }
        .defaultSize(width: 400, height: 300)
#endif
    }
}
