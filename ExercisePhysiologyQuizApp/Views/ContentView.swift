//
//  ContentView.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentViewModel
    
    
    var body: some View {
        NavigationView{
           ScrollView {
                LazyVStack{
                ForEach(model.quizModules) {
                    quiz in
                    
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.indigo)
                            .aspectRatio(CGSize(width: 200, height: 250), contentMode: .fit)
                            .shadow(radius: 10)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(quiz.category)
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                          
                            
                            Text(quiz.course.description)
                                .font(.headline)
                           Spacer()
                            
                            Image("\(quiz.course.image)")
                                .resizable()
                                .scaledToFit()
                                .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200, maxHeight: 300)
                                Spacer()
                            
                        }//Vstack
                        .padding()
                      
                        
                        
                    }
                }//ForEach Loop
               
               
                   
                }//LazyVStack
                .navigationTitle("Quizzes")
                .padding()
            }//ScrollView
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}
