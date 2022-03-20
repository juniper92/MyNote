//
//  ListViewModel.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/25.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var items: [ListModel] = [] {
        didSet {
            saveItems()
        }
    }
    let listItemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: listItemsKey),
            let savedItems = try? JSONDecoder().decode([ListModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func deleteAllItems() {
        items.removeAll()
    }
    
    func addItem(title: String) {
        let newItem = ListModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ListModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: listItemsKey)
        }
    }
}


