//
//  NavModel.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/8/25.
//

import Foundation

enum NavList: String, CaseIterable, Identifiable {
    case appStructure = "App Structure", 
         dataAndStorage = "Data And Storage",
         views = "Views"
    var id: Self { self }
    // var name: String { rawValue.capitalized }
}
