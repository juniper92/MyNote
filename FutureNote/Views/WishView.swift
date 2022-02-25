//
//  WishView.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/17.
//

import SwiftUI

struct WishView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack(spacing: 0) {
            Text("dfsfsdfsdf")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .top) {
            VStack(alignment: .leading, spacing: 8) {
                
                HStack {
                    Text("🏆 최종 목표")
                        .font(.custom("tway_air", size: 27))
                    
                    Spacer()
                }
                
                Text("궁극적으로 이루고 싶은 커다란 꿈들을 마음껏 적어요.\n그리고 매일 3번씩 읽어요. 내 꿈이 흐려지지 않게 이룰 때까지 되새기세요!")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                LinearGradient(colors: [Color.Palette.Mint.opacity(0.3), Color.Palette.TitleGreen.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .overlay(.ultraThinMaterial))
            .navigationBarHidden(true)
            .tint(colorScheme == .dark ? Color.Palette.LightGreen : Color.Palette.TitleGreen)
        }
    }
}

struct WishView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WishView()
                .preferredColorScheme(.dark)
        }
    }
}
