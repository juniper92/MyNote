//
//  VerificationView.swift
//  FutureNote
//
//  Created by Mila on 2022/04/21.
//

import SwiftUI

struct VerificationView: View {
    
    @StateObject var otpModel: OTPViewModel = .init()
    
    // MARK: - TextField FocusState
    @FocusState var activeField: OTPField?
    
    var body: some View {
        VStack {
            
            Text("본인인증")
                .font(.largeTitle.bold())
                .foregroundColor(.primary)
            
            OTPField()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .top)
        .onChange(of: otpModel.otpFields) { newValue in
            OTPCondition(value: newValue)
        }
    }
    
    
    // MARK: - 텍스트 1개만 지정
    func OTPCondition(value: [String]) {
        for index in 0..<6 {
            if value[index].count > 1 {
                otpModel.otpFields[index] = String(value[index].last!)
            }
        }
    }
    
    
    // MARK: - OTP TextField
    @ViewBuilder
    func OTPField() -> some View {
        HStack(spacing: 12) {
            
            ForEach(0..<6, id: \.self) { index in
                
                VStack(spacing: 8) {
                    TextField("", text: $otpModel.otpFields[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .focused($activeField, equals: activeStateForIndex(index: index))
                    
                    Rectangle()
                        .fill(activeField == activeStateForIndex(index: index) ? Color.Palette.DarkGreen : Color.Palette.DarkGreen.opacity(0.5))
                        .frame(height: 4)
                }
                .frame(width: 40)
            }
        }
    }
    
    func activeStateForIndex(index: Int) -> OTPField {
        
        switch index {
        case 0: return .field1
        case 1: return .field1
        case 2: return .field1
        case 3: return .field1
        case 4: return .field1
        default: return .field6
        }
    }
    
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}

// MARK: FocusState Enum
enum OTPField {
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
}
