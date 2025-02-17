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
    
    var body: some View {
        VStack {
            Toggle("Favorite", isOn: $episode.isFavorite) // Bind to the Boolean.
            PlayerView(episode: episode)
        }
    }
}

struct PlayerView: View {
    var episode: Episode
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            Text(episode.title)
            Text(episode.showTitle)
            PlayButton(isPlaying: $isPlaying) // Pass a binding.
        }
    }
}

struct PlayButton: View{
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: { self.isPlaying.toggle() }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                .opacity(0.8)
                .frame(width: 50, height: 50)
                .font(.system(size: 36))
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview("Player") {
    DataAndStorageDemo().frame(width: 500, height: 300)
}
