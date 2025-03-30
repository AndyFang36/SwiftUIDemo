//
//  MenuAndCommandDemo.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 3/30/25.
//

import SwiftUI

struct MenuAndCommandDemo: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
        }
        .padding()
    }
}

#Preview {
    MenuAndCommandDemo()
}
