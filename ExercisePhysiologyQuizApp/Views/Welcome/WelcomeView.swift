//
//  WelcomeView.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 5/12/22.
//

import SwiftUI

struct WelcomeView: View {
    
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.primaryColor
                    .ignoresSafeArea()
                
                VStack (spacing: 20){
                    Spacer()
                    Text("Welcome!")
                        .font(.system(size: 50, weight: .black, design: .default))
                        .foregroundColor(.white)
                        .shadow(radius: 6)
                    
                    Text("This Ex Phys Quiz App is to test your knowledge on all major areas of exercise physiology. Test your knowledge on the Muscular system, Cardiovascular system, and others!")
                        .font(.title2)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 25)
                    
                    
                    NavigationLink {
                        ContentView()
                    } label: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.secondaryColor)
                            .frame(width: 200, height: 50)
                            .overlay(
                                Text("Test Your Knowledge")
                                    .foregroundColor(Color.tertiaryColor)
                                    .fontWeight(.bold)
                                    
                            
                            )
                    }

                    Spacer()

                }//Vstack
                .padding()
            }
        }
        .navigationBarHidden(true)
    }//body
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
