//
//  ContentView.swift
//  SwiftUIDemoIOS
//
//  Created by Andy Fang on 2/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            DataAndStorageDemo()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
