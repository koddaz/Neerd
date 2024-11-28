//
//  FontCustom.swift
//  Neerd
//
//  Created by Albert Niklasson on 2024-11-27.
//

import SwiftUI

struct CustomFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("PressStart2P-Regular", size: 16)) // Default size
    }
}

extension View {
    func customFont(_ size: CGFloat = 16) -> some View {
        self.font(.custom("PressStart2P-Regular", size: size))
    }
}
