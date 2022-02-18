//
//  ListView.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/17.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "첫번째 리스트",
        "두번째 리스트",
        "세번째 리스트"
    ]
    
    var body: some View {
        ZStack {
            Color.Palette.Blue
                .opacity(0.2)
                .ignoresSafeArea(edges: .bottom)
            
            List {
                ForEach(items, id: \.self) { item in
                    ListRowView(title: item)
                        .listRowBackground(Color.Palette.Blue.opacity(0.2))
                }
                
            }
            .safeAreaInset(edge: .top) {
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack() {
                        Text("✍🏻 오늘 할 일")
                            .font(.custom("tway_air", size: 27))
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "circle.grid.2x1.fill")
                                .font(.headline)
                        }
                    }
                    Text("입력한 리스트는 자정이 지나면 사라져요.\n오늘 하루가 지나기 전에 목표한 일들을 마무리해봐요!")
                        .font(.caption)
                }
                .padding()
                .background(
                    LinearGradient(colors: [Color.Palette.Green.opacity(0.3), Color.Palette.TitleGreen.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .overlay(.ultraThinMaterial)
                )
            }
            // 필수!
            .navigationBarHidden(true)
            .tint(Color.Palette.TitleGreen)
        }
            
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
