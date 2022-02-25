//
//  LaunchScreen.swift
//  FutureNote
//
//  Created by Juniper on 2022/02/17.
//

import SwiftUI

struct LaunchScreen: View {
    
    @State private var showContentView: Bool = false
    @State var light = true
    
    var body: some View {
        
        Group {
            if showContentView {
                ContentView()
            } else {
                ZStack {
                    VStack(spacing: 30) {
                        
                        Text("액션\n노트")
                            .font(.custom("tway_air", size: 80))
                            .foregroundColor(Color.Palette.TitleGreen)
                    }
                    
                    EmitterView()
                        .scaleEffect(light ? 1 : 0, anchor: .top)
                        .opacity(light ? 1 : 0)
                        .ignoresSafeArea()
                }
                .background(Color.gray.opacity(0.3))
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 1).delay(1.2)) { // 0.7
                showContentView = true
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}


// UIKit의 CAEmmiterLayer
struct EmitterView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        // Emitter Layer
        let emitterLayer = CAEmitterLayer()
        // 위에서 아래로 떨어지는 애니메이션
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmitrCells()
        
        // 사이즈, 포지션
        emitterLayer.emitterSize = CGSize(width: getRect().width, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: getRect().width / 2, y: 0)
        
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func createEmitrCells() -> [CAEmitterCell] {
        
        // 여러 다른 쉐입의 꽃가루
        var emitterCells: [CAEmitterCell] = []
        
        for index in 1...16 {
            let cell = CAEmitterCell()
            
            // 흰색만
            cell.contents = UIImage(named: getImage(index: index))?.cgImage
            cell.color = getColor().cgColor
            // 새 입자 생성
            cell.birthRate = 1
            cell.lifetime = 10
            // 속도
            cell.velocity = 120
            // 크기
            cell.scale = 0.1
            cell.scaleRange = 0.3
            cell.emissionLongitude = .pi
            cell.emissionRange = 10
            cell.spin = 4.5
            cell.spinRange = 2
            
            // 접근성
            
            
            emitterCells.append(cell)
        }
        
        return emitterCells
    }
    
    func getColor() -> UIColor {
        let colors : [UIColor] = [UIColor.init(rgb: 0xf2f5ed), UIColor.init(rgb: 0xc0d689), UIColor.init(rgb: 0x98c728), UIColor.init(rgb: 0x45b17b), UIColor.init(rgb: 0x17dbc2), UIColor.init(rgb: 0xdad2df)]
        
        return colors.randomElement()!
    }
    
    func getImage(index: Int) -> String {
        
        if index < 4 {
            return "rectangle"
        }
        else if index > 5 && index <= 8 {
            return "circle"
        }
        else if index > 9 && index <= 12{
            return "heart"
        }
        else {
            return "whstar"
        }
    }
}

