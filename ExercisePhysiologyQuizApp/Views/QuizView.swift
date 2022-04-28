//
//  QuizView.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/27/22.
//

import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var model: ContentViewModel
    
    var body: some View {
      
        
        if model.currentQuestion != nil {
            
            ZStack(){
                Color.indigo
                    .ignoresSafeArea()
                
                VStack(spacing: 20){
                  
                    Text("\(model.currentQuestionIndex + 1) of \(model.currentQuiz?.course.test.questions.count ?? 0) question")
                    

                    
                    Text("\(model.currentQuestion?.content ?? "" )")
                    
                    ScrollView{
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) {
                            index in
                            
                            Text(model.currentQuestion?.answers[index] ?? "")
                        }
                    }
                    
                
                 
                    
                }//VStack
//                .navigationTitle("\(model.currentQuiz?.category ?? "") Quiz")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("\(model.currentQuiz?.category ?? "" )")
                            .foregroundColor(.white).fontWeight(.bold)
                    }
                }
            }//ZStack
            
        } else {
            ProgressView()
        }
        
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
           
    }
}
