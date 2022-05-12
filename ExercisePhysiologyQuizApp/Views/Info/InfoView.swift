//
//  InfoView.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 5/10/22.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20) {
                Spacer()
                HeaderComponent()
//
                Text("Background")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding()
                Text("The muscular system works with both the nervous system and the skeletal system to create movement of the human body. Skeletal muscle contracts and generates force. The contractino of skeletal muscle causes the bones to which they are attached to move, which creates the movement of body parts. The primary components of the muscular system are the individual muscle fibers (i.e, muscle cells)")
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
        InfoView()
    }
}
