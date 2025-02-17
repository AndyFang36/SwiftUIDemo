//
//  AppStructureDemo.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/8/25.
//

import SwiftUI

struct AppStructureDemo: View {
    @AppStorage("fontSize") private var fontSize = 16.0
    @AppStorage("selectedTheme") private var selectedTheme = AppTheme.system
    @Environment(\.openWindow) private var openWindow
    @State private var isSheetPresented = false
    
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
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("App Structure").font(.system(size: fontSize))
            }
#if os(macOS)
            AdvancedSettingsButton()
#endif
            Button("Open a new window") {
                openWindow(id: "demo")
            }
            Button("Open a util window") {
                openWindow(id: "UtilityID")
            }
            Button("Open Dialog") {
                isSheetPresented = true
            }
            .sheet(isPresented: $isSheetPresented) {
                MyDialog()
            }
        }
        .padding()
        .preferredColorScheme(theme())
    }
}

#Preview {
    AppStructureDemo().frame(width: 500, height: 300)
}
