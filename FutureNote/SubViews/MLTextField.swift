//
//  MultiLineTextField.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/24.
//

import SwiftUI

// https://www.youtube.com/watch?v=rmCvCic6Kv8 마저 따라서 만들기

struct MLTextField: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<MLTextField>) -> UITextView {
        
        let view = UITextView()
        view.font = .systemFont(ofSize: 19)
        view.text = "Type Something"
        view.textColor = UIColor.black.withAlphaComponent(0.35)
        return view
     }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MLTextField>) {
        
    }
}

