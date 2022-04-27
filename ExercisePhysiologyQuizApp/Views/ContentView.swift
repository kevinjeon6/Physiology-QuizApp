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
                    
                    NavigationLink(destination: QuizView()
                        .onAppear(perform: {
                            print(model.currentCourseSelected)
                        }),
                                   tag: quiz.id,
                                   selection: $model.currentCourseSelected)
                    {
                        CourseCard(category: quiz.category, description: quiz.course.description, image: quiz.course.image)
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
