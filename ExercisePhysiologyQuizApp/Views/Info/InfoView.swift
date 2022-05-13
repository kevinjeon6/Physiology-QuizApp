//
//  InfoView.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 5/10/22.
//

import SwiftUI

struct InfoView: View {
    
    var description: String
    
    @Environment(\.dismiss) var dismiss
    

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20) {
                Spacer()
                HeaderComponent()
                
             
                    Text("Background")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding()
                    
                    
                    Text(description)
                        .font(.system(size: 22, weight: .regular, design: .rounded))
                        .foregroundColor(.primary)
                        .padding(.bottom, 25)
     
             
                Button {
                    dismiss()
                } label: {
                    Text("Take the quiz")
                }
                .padding(.top, 25)

                
                
            }//Vstack
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, 25)
            .padding(.top, 15)
            .padding(.bottom, 25)
           
            
        }//ScrollView
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(description: "Demo")
    }
}
