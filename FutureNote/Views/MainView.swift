//
//  MainView.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/17.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case Card = "shootingstar"
    case Notes = "memo"
}

struct MainView: View {
    
    @State var currentTab: Tab = .Card
    
    // 디폴트탭바 숨겨!!!
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                NavigationView {
                    WishView()
                }
                .tag(Tab.Card)
                
                NavigationView {
                    ListView()
                }
                .tag(Tab.Notes)
            }
            
            // 탭바
            Group {
                Rectangle()
                    .fill(.gray.opacity(0.5))
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                
                HStack(spacing: 0) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        Button {
                            currentTab = tab
                        } label: {
                            Image(tab.rawValue)
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32)
                        }
                        .padding(5)
                        .background(currentTab == tab ? Color.gray.opacity(0.2).cornerRadius(12) : nil)
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.top, 8)
                .background(Color.gray.opacity(0.3))
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// MARK: - FUNCTION
func getRect() -> CGRect {
    return UIScreen.main.bounds
}
