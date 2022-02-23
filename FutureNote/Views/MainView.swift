//
//  MainView.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/17.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case Card = "moon1"
    case Notes = "memo"
}

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme
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
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 33, height: 33)
                        }
                        .padding(5)
                        .background(currentTab == tab ? ChangeBackgroundColor().cornerRadius(12) : nil)
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(8)
                .background(Color.Palette.Mint.opacity(0.3).ignoresSafeArea(edges: .bottom))
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    func ChangeBackgroundColor() -> Color {
        colorScheme == .dark ? Color.white.opacity(0.4) : Color.Palette.Mint.opacity(0.6)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
        
        MainView()
    }
}

// MARK: - FUNCTION
func getRect() -> CGRect {
    return UIScreen.main.bounds
}
