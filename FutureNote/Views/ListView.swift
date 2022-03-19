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
    @State var animate: Bool = false
    
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
            }
            
            // MARK: - Custom NavBar
            .safeAreaInset(edge: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("✍🏻 오늘 할 일")
                            .font(.custom("tway_air", size: 27))
                        
                        Spacer()
                        
                        Button {
                            listViewModel.deleteAllItems()
                        } label: {
                            listViewModel.items.isEmpty ? Text("") : Text("모두삭제").font(.callout)
                        }
                    }
                    
                    Text("오늘 할 일을 이곳에 입력해요.\n그리고 오늘이 지나기 전에 모두 마무리해요!")
                        .font(.caption)
                }
                .padding()
                .background(
                    LinearGradient(colors: [Color.Palette.Mint.opacity(0.3), Color.Palette.TitleGreen.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .overlay(.ultraThinMaterial))
            }
            .navigationBarHidden(true)
            .tint(colorScheme == .dark ? Color.Palette.LightGreen : Color.Palette.TitleGreen)
            
            // MARK: - 글쓰기 버튼
            Button {
                presentingSheet = true
            } label: {
                PlusButton(colorScheme: colorScheme, animate: animate)
            }
            .onAppear (perform: addAnimation)
            .sheet(isPresented: $presentingSheet) {
                AddListView()
            }
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.5)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}


@ViewBuilder
func PlusButton(colorScheme : ColorScheme, animate : Bool) -> some View {
    HStack {
        Image(systemName: "plus.circle")
            .font(.system(size: 60).weight(.thin))
            .foregroundColor(colorScheme == .dark ? Color.Palette.LightGreen : Color.Palette.TitleGreen)
            .scaleEffect(animate ? 1.3 : 1)
            .padding()
            .padding(.bottom)
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


