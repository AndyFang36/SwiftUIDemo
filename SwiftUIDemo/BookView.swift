//
//  BookView.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/16/25.
//

import SwiftUI

struct BookView: View {
    @Binding var book: Book?
    
    var body: some View {
        let available = book?.isAvailable ?? false
        ScrollView {
            Text(book?.title ?? "Here is no book.")
            Text(available ? "Available" : "Unavailable")
            // del
            Button("Delete") {
                book = nil
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            // add
            Button("Add") {
                book = Book()
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            // check
            Button("Check") {
                book?.isAvailable = false
            }
            .disabled(!available)
        }
    }
}

#Preview("Book View") {
    @Previewable @State var book: Book? = Book()
    
    BookView(book: $book)
        .frame(width: 500, height: 300)
}
