//
//  ListModel.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/24.
//

import SwiftUI

struct ListModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}

