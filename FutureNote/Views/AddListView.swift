//
//  AddListView.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/24.
//

import SwiftUI

struct AddListView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            ZStack(alignment: .bottom) {
                VStack(alignment: .center, spacing: 2) {
                    
                    Rectangle()
                        .overlay(
                            TextField("여기에 오늘의 목표를 입력하세요!", text: $textFieldText)
                                .font(.custom("tway_air", size: 16))
                                .frame(height: getRect().height / 5)
                                .foregroundColor(.primary.opacity(0.7))
                                .padding(.horizontal, 30)
                                .multilineTextAlignment(.leading)
                        )
                    
                    Divider()
                    
                    Button {
                        
                    } label: {
                        Text("저장하기")
                            .font(.headline.bold())
                            .foregroundColor(colorScheme == .dark ? .white.opacity(0.5) : Color.Palette.TitleGreen)
                            .padding()
                    }
                    
                }
                .frame(height: getRect().height / 4)
                .frame(maxWidth: .infinity)
                .foregroundColor(colorScheme == .dark ? Color.Palette.TitleGreen.opacity(0.06) : Color.Palette.LightGreen.opacity(0.2))
                .background(colorScheme == .dark ? Color.Palette.TitleGreen.opacity(0.1) : Color.Palette.LightGreen.opacity(0.2))
                .cornerRadius(14)
                .padding()
            }
            
            Spacer()
        }
    }
}

@ViewBuilder
func CustomDivider() -> some View {
    Rectangle()
        .fill(Color.primary.opacity(0.3))
        .frame(height: 1.2)
        .padding(.horizontal)
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView()
            .preferredColorScheme(.dark)
        AddListView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone SE (2nd generation)")
    }
}

