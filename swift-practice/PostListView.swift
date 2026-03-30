//
//  ContentView.swift
//  swift-practice
//
//  Created by Yuki Yoshida on 2026/03/01.
//

import SwiftUI

struct Post {
    var id: UUID = UUID()
    var name: String
    var text: String
}

struct PostListView: View {
    @State var isShowingCreatePostView = false
    let posts: [Post] = [
        Post(name:"Yuki", text:"Good morning"),
        Post(name:"Johnny", text:"Good afternoon"),
        Post(name:"Pega", text:"Good night"),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                ScrollView  {
                    ForEach(posts,id: \.id) { post in
                        NavigationLink {
                            PostDetailView(post: post)
                        } label: {
                            HStack(alignment: .top)
                            {
                                Circle()
                                    .frame(width: 40)
                                    .foregroundStyle(Color.blue)
                                VStack(alignment: .leading) {
                                    Text(post.name)
                                        .bold()
                                    Text(post.text)
                                        .multilineTextAlignment(.leading)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                            .background(Color.black.opacity(0.05))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                            .navigationTitle(Text("Posts"))
                        }
                        .foregroundStyle(.primary)
                    }
                }
                Button {
                    isShowingCreatePostView = true
                } label: {
                    Image(systemName: "plus")
                        .font(.largeTitle.bold())
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                        .clipShape(Circle())
                }
                .padding()
                .sheet(isPresented: $isShowingCreatePostView) {
                    CreatePostView()
                }
            }
            .navigationTitle("投稿一覧 ")
        }
    }
}

#Preview {
    PostListView()
}
