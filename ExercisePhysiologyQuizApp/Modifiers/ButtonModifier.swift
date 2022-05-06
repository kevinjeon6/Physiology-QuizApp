//
//  ButtonModifier.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 5/6/22.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .frame(height: 50)
    }
}

