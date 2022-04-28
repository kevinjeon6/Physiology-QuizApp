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
            
            ZStack{
                Color.blue
                
                VStack(spacing: 20){
                    Text("\(model.currentQuestionIndex + 1) of \(model.currentQuiz?.course.test.questions.count ?? 0) question")
                    
                
                 
                    
                }//VStack
                .navigationTitle("\(model.currentQuiz?.category ?? "") Quiz")
                .navigationBarTitleDisplayMode(.inline)
            }//ZStack
            
        } else {
            ProgressView()
        }
        
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(ContentViewModel())
    }
}
