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
    @Environment(\.dismissWindow) private var dismissWindow
//    @AppStorage("showMenuBarExtra") private var showMenuBarExtra = false
    
    var body: some Scene {
        //
        WindowGroup("SwiftUI Demo", id: "demo") {
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
        .commands {
            SidebarCommands()
        }
#if os(macOS)
        //
        Window("Help", id: "help") {
            HelpView()
        }
        .defaultSize(width: 400, height: 300)
        .keyboardShortcut("H")
        // Settings Windows
        Settings {
            SettingsView().frame(minWidth: 300, minHeight: 200)
        }
        .defaultSize(width: 400, height: 300)
        
        // Menu Bar Extra
//        MenuBarExtra("App Menu Bar Extra", systemImage: "star", isInserted: $showMenuBarExtra) {
//            StatusMenu()
//        }.menuBarExtraStyle(.menu)
        
        // Util Window
        UtilityWindow("UtilityTitle", id: "UtilityID") {
            Text("Content of UtilityWindow")
            Button("Done") {
                dismissWindow(id: "UtilityID")
            }
        }.defaultSize(width: 300, height: 500)
#endif
        // Document Group
        DocumentGroup(newDocument: MyDocument()) { file in
            TextEditor(text: file.$document.text)
        }
    }
}
