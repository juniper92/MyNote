//
//  AboutAppStorage.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/18.
//

import SwiftUI

struct User: Codable {
    var name = ""
    var age = 0
    
    func encode() -> Data? {
        let encoder = JSONEncoder()
        
        // 이 함수는 구조체를 데이터 타입으로 인코딩함. 리턴값은 실제로 AppStorage에 저장될 값.
        if let encoded = try? encoder.encode(self) {
            return encoded
        } else {
            return nil
        }
    }
    
    static func decode(userData: Data) -> User? {
        let decoder = JSONDecoder()
        
        // AppStorage에서 데이터 값을 가져오면, 화면에 값을 사용하고 표시할 수 있도록 다시 User구조체로 변환한다.
        if let user = try? decoder.decode(User.self, from: userData) {
            return user
        } else {
            return nil
        }
    }
}

struct AboutAppStorage: View {
    
    @AppStorage("user") var userData = User(name: "Juniper Y", age: 31).encode()!
    @State private var userName = ""
    @State private var age = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("AppStorage")
                .font(.largeTitle.bold())
            
            Text("구조체 저장 : AppStorage에 전체 구조체를 저장할 수 있다.")
            
            Text("Name: \(userName)")
            Text("Age: \(age)")
        }
        .font(.headline)
        .onAppear {
            getAppStorage()  // 데이터를 기본 타입으로 변경해야 함
        }
    }
    
    
    // AppStorage는 데이터타입이기 때문에 디코딩해야한다.
    func getAppStorage() {
        if let appUser = User.decode(userData: userData) {
            userName = appUser.name
            age = appUser.age
        }
    }
}

struct AboutAppStorage_Previews: PreviewProvider {
    
    @AppStorage("username") static var username: String!
    
    static var previews: some View {
        username = "아에이오우"
        return AboutAppStorage()
    }
}

