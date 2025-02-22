//
//  PlayerView.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/16/25.
//

import SwiftUI

struct PlayerView: View {
    var episode: Episode
    @State private var isPlaying: Bool = false
    @State private var receivedValue = ""
    
    var body: some View {
        VStack {
            Text(isPlaying ? "Playing" : "Paused")
            Text(episode.title)
            Text(episode.showTitle)
            PlayButton(isPlaying: $isPlaying)
                .onPreferenceChange(CustomPreferenceKey.self) { value in
                    receivedValue = value
                    print("收到子视图数据：\(value)")
                }
        }
    }
}

struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: { self.isPlaying.toggle() }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                .opacity(0.8)
                .frame(width: 80, height: 50)
                .font(.system(size: 36))
                .symbolEffect(.bounce, value: isPlaying)
        }
        .buttonStyle(.borderedProminent)
        .tint(.orange)
        .preference(key: CustomPreferenceKey.self, value: "from play button")
    }
}

// 自定义 Key（需要遵守 PreferenceKey 协议）
struct CustomPreferenceKey: PreferenceKey {
    // 定义默认值（当没有子视图提供数据时使用）
    static var defaultValue: String = "默认值"
    
    // 合并多个子视图的值（自上而下遍历时合并）
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue() // 这里简单取最后一个子视图的值
    }
}


#Preview("Player") {
    @Previewable @State var episode = Episode(
        title: "Some Episode",
        showTitle: "Great Show",
        isFavorite: false
    )
    
    PlayerView(episode: episode)
        .frame(width: 500, height: 300)
}
