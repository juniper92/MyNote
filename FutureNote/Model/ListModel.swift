//
//  ListModel.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/24.
//

import SwiftUI

struct ListModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // ListModel에 함수를 넣어서 ListModel을 갱신. ListModel 내에서 호출되므로 ListModel이 이미 있고 기존 모델에 대해 업데이트를 완료함
    // 해당 구조체는 이뮤터블로, 내부 속성들은 모두 상수이다. var로 선언했다면 내부 속성을 다른 곳에서 직접 변경할 수 있는 경우가 많은데, 그럼 실제로 데이터베이스와 타이틀이 다른 경우가 발생할 수 있다. 때문에 불변의 구조체를 만들고 모든 것을 상수로 만들어서 즉석에서 변경하지 못하고, 이 기능만을 통해서 업데이트되게 한다.
    // 아래 기능을 사용하지 않는 한 이 항목이나 변수 업데이트는 불가능하다. 이를 통해 업데이트와 모델을 나타내는 앱의 모든 논리가 이 기능 안에 포함되도록 할 수 있다.
    func updateCompletion() -> ListModel {
        return ListModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

