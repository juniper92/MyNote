//
//  ListViewModel.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/25.
//

import Foundation
import SwiftUI


// EnvironmentObject로 만들 예정 
class ListViewModel: ObservableObject {
    
    @Published var items: [ListModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ListModel(title: "첫번째 타이틀", isCompleted: false),
            ListModel(title: "222222", isCompleted: true),
            ListModel(title: "3번쨰애애애랭", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ListModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ListModel) {
        if let index = items.firstIndex(where: { (existingItem) -> Bool in
            return existingItem.id == item.id
        }) {
            items[index] = ListModel(title: item.title, isCompleted: !item.isCompleted)
        }
    }
}


