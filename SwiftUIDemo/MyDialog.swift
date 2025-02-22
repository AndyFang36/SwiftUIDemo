//
//  MyDialog.swift
//  SwiftUIDemo
//
//  Created by Andy Fang on 2/9/25.
//

import SwiftUI

struct MyDialog: View {
    @Environment(\.isPresented) private var isPresented
    @State private var showAlert = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("这是一个模态视图")
            Button("ok") {
                showAlert = true
            }
            .alert("确认删除", isPresented: $showAlert) {
                Button("删除", role: .destructive) { /* 执行删除 */ }
                Button("取消", role: .cancel) { dismiss() }
            } message: {
                Text("此操作不可撤销！")
            }
        }
        .onChange(of: isPresented) { _, isPresented in
            if isPresented {
                print("isPresented")
            }
        }
        
    }
}

#Preview {
    MyDialog()
}
