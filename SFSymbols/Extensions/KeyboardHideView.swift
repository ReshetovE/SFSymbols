//
//  KeyboardHideView.swift
//  SFSymbols
//
//  Created by Egor on 28/06/2019.
//  Copyright © 2019 Reshetov Egor. All rights reserved.
//

import SwiftUI

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.keyWindow?.endEditing(force)
    }
}
