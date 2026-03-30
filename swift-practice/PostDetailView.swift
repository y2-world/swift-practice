//
//  SwiftUIView.swift
//  swift-practice
//
//  Created by Yuki Yoshida on 2026/03/30.
//

import SwiftUI

struct PostDetailView: View {
    var post: Post
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Circle()
                        .frame(width: 50)
                        .foregroundStyle(.blue)
                    Text(post.name)
                        .bold()
                }
                Text(post.text)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationTitle(Text("Post Detail"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PostDetailView(post: Post(name: "chu", text: "chuchu shitai"))
}
