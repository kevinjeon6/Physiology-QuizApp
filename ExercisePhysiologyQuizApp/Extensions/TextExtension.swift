//
//  SubmitExtension.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 5/6/22.
//

import SwiftUI


extension Text {
    func ButtonTextStyle() -> some View {
        self
            .font(.body)
            .fontWeight(.bold)
            .padding()
            .foregroundColor(Color.tertiaryColor)
    }
}
