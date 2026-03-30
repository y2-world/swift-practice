//
//  CreatePostView.swift
//  swift-practice
//
//  Created by Yuki Yoshida on 2026/03/30.
//

import SwiftUI

struct CreatePostView: View {
    @Environment(\.dismiss) var dismiss
    @State var text = ""
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Circle()
                        .frame(width: 40)
                        .foregroundColor(.blue)
                    TextEditor(text: $text)
                        .frame(height: 150)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray)
                        )
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("キャンセル") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CreatePostView()
}
