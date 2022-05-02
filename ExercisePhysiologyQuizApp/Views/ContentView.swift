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
                            model.getFirebaseQuestions(module: quiz) {
                                model.beginQuizModule(quiz.course.test.id)
                            }
                          
                        }),
                                   tag:quiz.id.hash,
//                                    quiz.course.test.id,
                                   selection: $model.currentCourseTestSelected)
                    {
                        CourseCard(category: quiz.category, description: quiz.course.description, image: quiz.course.image)
                    }
                    
                
                }//ForEach Loop
                }//LazyVStack
                .navigationBarTitle("Quizzes")
                .padding()
            }//ScrollView
        }//NavigationView
//        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}
