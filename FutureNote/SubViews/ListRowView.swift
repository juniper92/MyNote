//
//  ListRowView.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/18.
//

import SwiftUI

struct ListRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let item: ListModel
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle.dotted")
                .foregroundColor(colorScheme == .dark ? Color.Palette.LightGreen : Color.Palette.TitleGreen)
            Text(item.title)
                .padding(.horizontal, 6)
            Spacer()
        }
        .font(.custom("tway_air", size: 16))
        .padding(.horizontal, 3)
        .padding(.vertical, 5)
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ListModel(title: "111111", isCompleted: false)
    static var item2 = ListModel(title: "222222222", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
