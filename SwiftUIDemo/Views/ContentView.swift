//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selected: NavList = .appStructure
    @State private var searchText: String = ""
    @State private var searchTokens: [FruitToken] = []
    @State private var scope: ProductScope = .fruit
    
    @AppStorage("selectedTheme") private var selectedTheme = AppTheme.system
    
    func theme() -> ColorScheme? {
        switch selectedTheme {
            case .dark:
                return ColorScheme.dark
            case .light:
                return ColorScheme.light
            default:
                return nil
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(NavList.allCases, selection: $selected) { item in
                Text(item.rawValue)
            }
            .navigationSplitViewColumnWidth(min: 150, ideal: 200, max: 400)
        } detail: {
            switch (selected) {
                case .appStructure:
                    AppStructureDemo().navigationTitle("App Structure")
                case .dataAndStorage:
                    DataAndStorageDemo().navigationTitle("Data And Storage")
                case .views:
                    ViewsDemo().navigationTitle("Views")
            }
        }
        .searchable(
            text: $searchText,
            tokens: $searchTokens,
            placement: .sidebar,
            prompt: "search..."
        ) { token in
            switch token {
                case .apple: Text("Apple")
                case .banana: Text("Banana")
                case .pear: Text("Pear")
            }
        }
        .searchSuggestions {
            Text("Apple").searchCompletion(FruitToken.apple)
            Text("Pear").searchCompletion(FruitToken.pear)
            Text("Banana").searchCompletion(FruitToken.banana)
        }
        .searchScopes($scope) {
            Text("Fruit").tag(ProductScope.fruit)
            Text("Vegetable").tag(ProductScope.vegetable)
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button("Edit") {
                    print("Editing...")
                }
            }
        }
        .preferredColorScheme(theme())
    }
}

enum ProductScope {
    case fruit
    case vegetable
}

enum FruitToken: String, Identifiable, Hashable, CaseIterable {
    case apple
    case pear
    case banana
    var id: Self { self }
}

#Preview {
    ContentView().frame(width: 500, height: 300)
}
