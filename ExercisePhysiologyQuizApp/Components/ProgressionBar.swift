//
//  ProgressView.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 5/12/22.
//

import SwiftUI

struct ProgressionBar: View {
    @Binding var progressAmount: Float
    

    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geometry in
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
             
                
                withAnimation(.linear) {
                    Rectangle()
                        .frame(width:
                                min(CGFloat(self.progressAmount) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(.yellow)
                }
                
                
                
            }//Geometry reader
            .cornerRadius(45)
        }//Zstack
       

    }
    
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
