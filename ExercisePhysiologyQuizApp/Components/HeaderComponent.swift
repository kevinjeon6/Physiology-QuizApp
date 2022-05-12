//
//  HeaderComponent.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 5/10/22.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(alignment: .center) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(.secondary)
                .opacity(0.2)
            
        }//Vstack
        
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
    }
}
