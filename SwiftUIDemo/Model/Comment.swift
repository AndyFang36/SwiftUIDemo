//
//  Comment.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/17/25.
//

import Foundation

struct Comment: Identifiable {
    let id = UUID()
    let user: String
    let content: String
}
