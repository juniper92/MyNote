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
                    Text("๐ ์ต์ข ๋ชฉํ")
                        .font(.custom("tway_air", size: 27))
                    
                    Spacer()
                }
                
                Text("๊ถ๊ทน์ ์ผ๋ก ์ด๋ฃจ๊ณ  ์ถ์ ์ปค๋ค๋ ๊ฟ๋ค์ ๋ง์๊ป ์ ์ด์.\n๊ทธ๋ฆฌ๊ณ  ๋งค์ผ 3๋ฒ์ฉ ์ฝ์ด์. ๋ด ๊ฟ์ด ํ๋ ค์ง์ง ์๊ฒ ์ด๋ฃฐ ๋๊น์ง ๋์๊ธฐ์ธ์!")
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
