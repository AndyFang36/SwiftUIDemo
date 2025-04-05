//
//  ListView.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 3/6/25.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            Text("A List Item")
            Text("A Second List Item")
            Text("A Third List Item")
        }
    }
}

#Preview {
    ListView()
        .frame(width: 400, height: 300)
}
