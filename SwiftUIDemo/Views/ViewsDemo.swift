//
//  ViewsDemo.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/17/25.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

/** Views Demo */
struct ViewsDemo: View { 
    let url = URL(string: "https://example.com")!
    @State private var scale = 1.0
    @State private var message = "Loading..."
    
    var myModifier: some ViewModifier {
#if DEBUG
        return EmphasizedLayout()
#else
        return EmptyModifier()
#endif
    }
    
    @ViewBuilder  // 隐式使用 @ViewBuilder
    var body: some View {
        ScrollView {
            // The order in which you apply modifiers matters.
            VStack {
                Text("Hello, World!").frame(width: 100).border(.cyan)
                Text("Hello, World!").border(.cyan).frame(width: 100)
            }.help("help text...")
            /// .font(.body)
            .bold()
            .modifier(CaptionTextFormat())
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            VStack {
                Image(systemName: "bus")
                    .resizable()
                    .frame(width:50, height:50)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.easeInOut.repeatCount(5)) {
                            scale = 2
                        }
                    }
                Text("Downtown Bus").borderedCaption()
            }
            NewsView()
            TimerView()
            Text(message).task {
                do {
                    var receivedLines = [String]()
                    for try await line in url.lines {
                        receivedLines.append(line)
                        message = "Received \(receivedLines.count) lines"
                    }
                } catch {
                    message = "Failed to load!"
                }
            }
            FlavorPicker()
            //
            VStack {
                Color.yellow.frame(width: 100, height: 100, alignment: .center)
                    .zIndex(1)
                    .opacity(0.5)
                Color.red.frame(width: 100, height: 100, alignment: .center)
                    .padding(-50)
            }
            // hidden
            HiddenView()
            //
            Text("这是一条敏感信息")
                .padding()
                .privacySensitive()
            Divider()
            // Animation
            AnimationView()
        }
        .padding()
        .modifier(myModifier)
        .onAppear {
            print("views demo appear...")
        }
        .onDisappear {
            print("views demo disappear...")
        }
    }
}

struct CaptionTextFormat: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.caption).foregroundColor(.secondary)
    }
}

struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1)
            )
            .foregroundColor(.blue)
    }
}

struct EmphasizedLayout: ViewModifier {
    func body(content: Content) -> some View {
        content.border(.red)
    }
}

extension View {
    func captionTextFormat() -> some View {
        /// modifier(CaptionTextFormat())
        ModifiedContent(content: self, modifier: CaptionTextFormat())
    }
    
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}

struct NewsView: View {
    @State private var news: [String] = []
    
    var body: some View {
        List(news, id: \.self) { article in
            Text(article)
        }
        .onAppear {
            self.loadNews()
        }
    }
    
    func loadNews() {
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.news = ["News Article 1", "News Article 2", "News Article 3"]
        }
    }
    
}

struct TimerView: View {
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            Text("Timer is \(isTimerRunning ? "running" : "stopped")")
            Button(isTimerRunning ? "Stop Timer" : "Start Timer") {
                if isTimerRunning {
                    timer?.invalidate()
                } else {
                    startTimer()
                }
                isTimerRunning.toggle()
            }.interactionActivityTrackingTag("ButtonTag")
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            // Timer logic here
        }
    }
}

struct FlavorPicker: View {
    @State private var selectedFlavor: Flavor? = nil
    
    var body: some View {
        Picker("Flavor", selection: $selectedFlavor) {
            ForEach(Flavor.allCases) { flavor in
                Text(flavor.rawValue)
                    .tag(flavor)
            }
        }
    }
}

struct HiddenView: View {
    @State private var isHidden = false
    @State private var toggle1 = false
    @State private var toggle2 = false
    @State private var selectedFlavor: Flavor? = nil
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "a.circle.fill")
                Image(systemName: "b.circle.fill")
                if !isHidden {
                    Image(systemName: "c.circle.fill")
                }
                Image(systemName: "d.circle.fill")
            }
            Toggle("Hide", isOn: $isHidden).toggleStyle(.switch)
        }
        VStack {
            Toggle(isOn: $toggle1) {
                Text("Toggle 1")
            }
            .labelsHidden()
            
            Toggle(isOn: $toggle2) {
                Text("Toggle 2")
            }
        }
        Menu("select") {
            Picker("Flavor", selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            }
            .labelsVisibility(.visible)
        }
    }
    
}

struct AnimationView: View {
    @State private var scale = 0.5
    @State private var isTrailing = false
    @State private var degrees = Double.zero
    @State private var isActive = false
    @State private var adjustBy = 100.0
    @State private var gearRunning = true
    @State private var gearDegrees = Double.zero

    private var driveAnimation: Animation {
        .easeInOut
        .repeatCount(3, autoreverses: true)
        .speed(0.5)
    }
    
    private var myAnimation: Animation {
        .linear
        .speed(0.1)
        .repeatForever(autoreverses: false)
    }

    var body: some View {
        VStack {
            Text("Animation").font(.title)
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .fill(.blue)
                            .scaleEffect(scale)
                            .animation(.easeIn, value: scale)
                        Text("easeIn")
                    }
                    ZStack {
                        Circle()
                            .fill(.blue)
                            .scaleEffect(scale)
                            .animation(.easeOut, value: scale)
                        Text("easeIn")
                    }
                    ZStack {
                        Circle()
                            .fill(.blue)
                            .scaleEffect(scale)
                            .animation(.easeInOut(duration: 1), value: scale)
                        Text("easeIn")
                    }
                }
                HStack {
                    Button("-") {
                        scale -= 0.1
                    }
                    Button("Reset") {
                        scale = 0.5
                    }
                    Button("+") {
                        scale += 0.1
                    }
                }
            }.border(.red)
            //
            VStack(alignment: isTrailing ? .trailing : .leading) {
                Image(systemName: "box.truck").font(.system(size: 64))
                Toggle("Move", isOn: $isTrailing.animation(driveAnimation))
                    .frame(maxWidth: .infinity)
                    .toggleStyle(.switch)
            }.border(.red)
            //
            VStack {
                Text("Hello, SwiftUI!")
                    .font(.system(size: 36))
                    .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
                Button("Animation1") {
                    withAnimation {
                        degrees = (degrees == .zero) ? 180 : .zero
                    }
                }.frame(maxWidth: .infinity)
                Text("Hello, SwiftUI!")
                    .font(.system(size: 36))
                    .rotationEffect(.degrees(degrees))
                    .animation(.default, value: degrees)
            }.border(.red)
            // linear
            VStack(alignment: isActive ? .trailing : .leading) {
                Circle().fill(isActive ? .red : .yellow).frame(width: 50, height: 50)
                Button("Animaiton") {
                    withAnimation(.linear(duration: 1)) {
                        isActive.toggle()
                    }
                }.frame(maxWidth: .infinity)
            }.border(.red)
            // delay
            VStack(spacing: 40) {
                HStack(alignment: .bottom) {
                    Capsule()
                        .frame(width: 50, height: 175 - adjustBy)
                        .animation(.easeInOut, value: adjustBy)
                    Capsule()
                        .frame(width: 50, height: 175 + adjustBy)
                        .animation(.easeInOut.delay(0.5), value: adjustBy)
                }
                Button("Animate") {
                    adjustBy *= -1
                }.frame(maxWidth: .infinity)
            }.border(.red)
            // repeat
            VStack {
                Image(systemName: "gear")
                    .font(.system(size: 86))
                    .rotationEffect(.degrees(gearDegrees))
                    
                    .animation(gearRunning ? myAnimation : nil, value: gearDegrees)
                Toggle("Toggle", isOn: $gearRunning)
                    .frame(maxWidth: .infinity)
                    .toggleStyle(.switch)
            }
            .onAppear {
                withAnimation(myAnimation) {
                    gearDegrees = 360.0
                }
            }

        }
    }
}

#Preview {
    ViewsDemo().frame(width: 500, height: 600)
}
