//
//  OTPViewModel.swift
//  FutureNote
//
//  Created by Mila on 2022/04/21.
//

import Foundation
import SwiftUI

class OTPViewModel: ObservableObject {
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
}
