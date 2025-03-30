//
//  ControlAndIndicator.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 3/6/25.
//

import SwiftUI

struct ControlAndIndicatorView: View {
    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango"
    ]
    
    func copy() -> Void {
        return;
    }
    
    func cut() -> Void {
        return;
    }
    
    func del() -> Void {
        return;
    }
    
    var body: some View {
        
        List {
            Text("xxxxx")
        }
    }
}

#Preview {
    ControlAndIndicator()
}
