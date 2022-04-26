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
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.indigo)
                            .aspectRatio(CGSize(width: 200, height: 250), contentMode: .fit)
                            .shadow(radius: 10)
                    }
                    
//                    Text(quiz.category)
//
////                    Image("\(quiz.course.image)")
//
//                    Text(quiz.course.description)
                }//ForEach Loop
                .padding()
               
                   
                }//LazyVStack
                .navigationTitle("Quizzes")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}
