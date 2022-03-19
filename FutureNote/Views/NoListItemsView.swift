//
//  NoListItemsView.swift
//  FutureNote
//
//  Created by Mila on 2022/03/19.
//

import SwiftUI

struct NoListItemsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("이곳을 눌러 할 일을 새롭게 추가해요 😊")
                    .font(.custom("tway_air", size: 20))
                    .fontWeight(.semibold)
            }
            .padding()
            .cornerRadius(12)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoListItemsView()
    }
}
