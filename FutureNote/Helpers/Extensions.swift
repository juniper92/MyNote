//
//  Extensions.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/17.
//

import SwiftUI
import UIKit 


// MARK: - 커스텀컬러
extension Color {
    struct Palette {
        static var Blue: Color {
            return Color("Blue")
        }
        
        static var Mint: Color {
            return Color("Mint")
        }
        
        static var LightGreen: Color {
            return Color("LightGreen")
        }
        
        static var Pink: Color {
            return Color("Pink")
        }
        
        static var DarkGreen: Color {
            return Color("DarkGreen")
        }
        
        static var TitleGreen: Color {
            return Color("Title")
        }
    }
}

// MARK: - hexcolor -> UIColor
extension UIColor {
    convenience init(rgb: UInt) {
       self.init(
        red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgb & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
       )
    }
}

// MARK: - 뷰 스와이프
extension UINavigationController {
    open override func viewDidLoad() {
        // 먼저 viewDidLoad가 발생해야 하는 모든 일반항목 호출
        super.viewDidLoad()
        // 기본적으로 NavigationView는 더 이상 popGestureRecognizer의 대리자가 아니며, 기본적으로 계속 사용 가능
        interactivePopGestureRecognizer?.delegate = nil
    }
}
