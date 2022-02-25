//
//  NavigationTitleView.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/25.
//

import SwiftUI

struct NavigationTitleView: View {
    
    let title: String
    let description: String
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                Text(title)
                    .font(.custom("tway_air", size: 27))
                
                Spacer()
                
                

            }
        }
    }
}
//
//struct NavigationTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationTitleView()
//    }
//}
