//
//  FutureNoteApp.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/16.
//

import SwiftUI

@main
struct FutureNoteApp: App {
    
    // 앱 전체에서 사용될 예정이므로, 앱의 시작 부분에 생성
    // 이 객체를 관찰하고 싶다면, 만약 이 객체가 바뀌면, 뷰가 실제로 업데이트될것이다. 여기에 속성래퍼 추가해야 함
    // class에는 @StateObject
    @StateObject var listViewMode: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
        }
    }
}
