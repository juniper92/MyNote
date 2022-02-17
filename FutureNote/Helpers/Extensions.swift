//
//  Extensions.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/17.
//

import SwiftUI
import UIKit 

extension Color {
    
    struct Palette {
        
        static var Blue: Color {
            return Color("Blue")
        }
        
        static var Green: Color {
            return Color("Green")
        }
        
        static var Orange: Color {
            return Color("Orange")
        }
        
        static var Pink: Color {
            return Color("Pink")
        }
        
        static var Yellow: Color {
            return Color("Yellow")
        }
        
        static var TitleGreen: Color {
            return Color("Title")
        }
    }
}

// hexcolor - uicolor extension 
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
