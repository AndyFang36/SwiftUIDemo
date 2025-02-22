//
//  ItemDetailView.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/6/25.
//

import SwiftUI

struct ItemDetailView: View {
    var id: UUID?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text("")
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ItemDetailView(id: UUID())
}
