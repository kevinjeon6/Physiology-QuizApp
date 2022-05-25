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
    
    @State var showInfoSheet = false
    

  
    
    var body: some View {
        
        
        ZStack(){
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.secondaryColor)
                .aspectRatio(CGSize(width: 200, height: 225), contentMode: .fit)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(category)
                        .font(.title)
                        .foregroundColor(Color.tertiaryColor)
                    .fontWeight(.bold)
                    Spacer()
                        Button {
                            showInfoSheet.toggle()
                        } label: {
                            Image(systemName: "info.circle")
                        }
                        .accentColor(Color.tertiaryColor)
                        .sheet(isPresented: $showInfoSheet) {
                            InfoView(description: description)
                        
                    }
                
                        
                   

                }//Hstack
              
                
                
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
        CourseCard(category: "Skeletal Muscle", description: "muscle",  image: "muscle")
    }
}
