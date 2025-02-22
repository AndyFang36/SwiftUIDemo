//
//  MyDocument.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/7/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct MyDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.plainText] }
    
    var text: String = ""
    
    init(text: String = "") {
        self.text = text
    }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return .init(regularFileWithContents: text.data(using: .utf8)!)
    }
}
