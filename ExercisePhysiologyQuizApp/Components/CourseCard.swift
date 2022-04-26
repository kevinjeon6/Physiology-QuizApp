//
//  CourseCard.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/26/22.
//

import SwiftUI

struct CourseCard: View {
    
    var category: String
    var description: String
    var image: String
    
    var body: some View {
        
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.indigo)
                .aspectRatio(CGSize(width: 200, height: 250), contentMode: .fit)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(category)
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
              
                
                Text(description)
                    .font(.headline)
               Spacer()
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200, maxHeight: 300)
                    Spacer()
                
            }//Vstack
            .padding()

        }//Zstack
        
        
    }
}

struct CourseCard_Previews: PreviewProvider {
    static var previews: some View {
        CourseCard(category: "Skeletal Muscle", description: "Muscle", image: "muscle")
    }
}
