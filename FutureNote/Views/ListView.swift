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
                        Text("โ๐ป ์ค๋ ํ  ์ผ")
                            .font(.custom("tway_air", size: 27))
                        
                        Spacer()
                        
                        Button {
                            listViewModel.deleteAllItems()
                        } label: {
                            listViewModel.items.isEmpty ? Text("") : Text("๋ชจ๋์ญ์ ").font(.callout)
                        }
                    }
                    
                    Text("์ค๋ ํ  ์ผ์ ์ด๊ณณ์ ์๋ ฅํด์.\n๊ทธ๋ฆฌ๊ณ  ์ค๋์ด ์ง๋๊ธฐ ์ ์ ๋ชจ๋ ๋ง๋ฌด๋ฆฌํด์!")
                        .font(.caption)
                }
                .padding()
                .background(
                    LinearGradient(colors: [Color.Palette.Mint.opacity(0.3), Color.Palette.TitleGreen.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .overlay(.ultraThinMaterial))
            }
            .navigationBarHidden(true)
            .tint(colorScheme == .dark ? Color.Palette.LightGreen : Color.Palette.TitleGreen)
            
            // MARK: - ๊ธ์ฐ๊ธฐ ๋ฒํผ
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


