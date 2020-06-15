//
//  Modifier.swift
//  FrontYard
//
//  Created by Dustin yang on 6/14/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.padding()
            .border(COLOR_LIGHT_GRAY, width: 1)
            .padding([.top, .leading, .trailing])
    }
}

struct SigninButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.padding().background(Color.black).cornerRadius(5).shadow(radius: 10, x: 0, y: 10).padding()
    }
}

