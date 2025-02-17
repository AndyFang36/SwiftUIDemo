//
//  DataAndStorage.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/15/25.
//

import SwiftUI

struct DataAndStorageDemo: View {
    @State private var isPlaying = true
    
    var body: some View {
        Button(action: { self.isPlaying.toggle()}) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                .opacity(0.8)
                .frame(width: 50, height: 50)
                .font(.system(size: 36))
//                .background(Color.red.opacity(0.3))
            // Text("OK").font(.system(size: 36))
        }
        // .background(Color.green.opacity(0.5))
        .buttonStyle(.borderedProminent)
        // .frame(width: 200, height: 100)
        
    }
}



#Preview("Button") {
    DataAndStorageDemo().frame(width: 500, height: 300)
}
