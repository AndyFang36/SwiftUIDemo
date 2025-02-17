//
//  DataAndStorage.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/15/25.
//

import SwiftUI

struct DataAndStorageDemo: View {
    @State private var episode = Episode(
        title: "Some Episode",
        showTitle: "Great Show",
        isFavorite: false
    )
    @State private var book: Book?
    
    var body: some View {
        VStack {
            Toggle("Favorite", isOn: $episode.isFavorite).toggleStyle(.switch)
            PlayerView(episode: episode)
            Divider()
            BookView(book: $book)
                .task {
                    book = Book()
                }
        }
    }
}

#Preview("Data And Storage") {
    DataAndStorageDemo().frame(width: 500, height: 300)
}
