//
//  AppStructureDemo.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/8/25.
//

import SwiftUI

struct AppStructureDemo: View {
    @AppStorage("fontSize") private var fontSize = 16.0
    
    @Environment(\.openWindow) private var openWindow
    @State private var isSheetPresented = false
    
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
        
    }
}

#Preview {
    AppStructureDemo().frame(width: 500, height: 300)
}
