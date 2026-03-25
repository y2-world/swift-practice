//
//  ContentView.swift
//  swift-practice
//
//  Created by Yuki Yoshida on 2026/03/01.
//

import SwiftUI

struct AView: View {
    @State var isShowingBView : Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("B Viewへモーダル遷移") {
                    isShowingBView = true
                }
                .sheet(isPresented: $isShowingBView) {
                    BView()
                }
                
                NavigationLink("CViewへナビゲーション遷移") {
                    CView()
                }
            }
            .navigationTitle(Text("AView"))
        }
    }
}

struct BView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                Text("BView")
                Button("閉じる") {
                    dismiss()
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
        .ignoresSafeArea()
        .navigationTitle(Text("BView"))
    }
}

struct CView: View {
    var body: some View {
        ZStack {
            NavigationLink("DViewへナビゲーション遷移") {
                DView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .ignoresSafeArea()
        .navigationTitle(Text("CView"))
    }
}

struct DView: View {
    var body: some View {
        ZStack {
            Text("DView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .ignoresSafeArea()
        .navigationTitle(Text("DView"))
    }
}

#Preview {
    AView()
}
