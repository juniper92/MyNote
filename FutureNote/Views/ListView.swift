//
//  ListView.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/17.
//

import SwiftUI

struct ListView: View {
    
    @State private var presentingSheet = false
    @Environment(\.colorScheme) var colorScheme
        
    @EnvironmentObject var listViewModel: ListViewModel
  
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            Color.Palette.Blue
                .opacity(0.2)
                .ignoresSafeArea(edges: .bottom)
            
            List {
                ForEach(listViewModel.items) { item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
            }
            // MARK: - Custom NavBar
            .safeAreaInset(edge: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        Text("✍🏻 오늘 할 일")
                            .font(.custom("tway_air", size: 27))
                        
                        Spacer()
                        
                        Button {
//                             MARK: - EditButton기능 삽입
                        } label: {
                            // Image(systemName: "circle.grid.2x1.fill")
                            Text("편집")
                                .font(.callout)
                        }
                    }
                    
                    Text("입력한 리스트는 자정이 지나면 사라져요.\n오늘 하루가 지나기 전에 목표한 일들을 마무리해봐요!")
                        .font(.caption)
                    
                }
                .padding()
                .background(
                    LinearGradient(colors: [Color.Palette.Mint.opacity(0.3), Color.Palette.TitleGreen.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .overlay(.ultraThinMaterial))
            }
            .navigationBarHidden(true)  // 필수
            .tint(colorScheme == .dark ? Color.Palette.LightGreen : Color.Palette.TitleGreen)
            
            // MARK: - 글쓰기 버튼
            Button {
                presentingSheet = true
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 60).weight(.thin))
                    .foregroundColor(colorScheme == .dark ? Color.Palette.LightGreen : Color.Palette.TitleGreen)
                    .padding()
                    .padding(.bottom)
            }
            .sheet(isPresented: $presentingSheet) {
                AddListView()
            }
        }
        
    }
    
}

@ViewBuilder
func PlusButton(colorScheme : ColorScheme) -> some View {
    HStack {
        Spacer()
        
        Image(systemName: "plus")
            .font(.largeTitle.weight(.semibold))
            .foregroundColor(colorScheme == .dark ? Color.Palette.LightGreen : Color.Palette.TitleGreen)
        
        Spacer()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(ListViewModel())

    }
}


