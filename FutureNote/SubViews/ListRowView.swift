//
//  ListRowView.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/18.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String 
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
        .font(.custom("tway_air", size: 15))
        .padding(.horizontal)
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "첫번째 타이틀")
    }
}
