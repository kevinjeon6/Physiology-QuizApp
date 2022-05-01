//
//  AwesomeView.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 5/1/22.
//

import SwiftUI

struct AwesomeView: View {
    
    @EnvironmentObject var model: ContentViewModel
    
    var numberCorrect: Int
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Text("\(numberCorrect) out of \(model.currentQuiz?.course.test.questions.count ?? 0)")
                    .font(.system(size: 50, weight: .heavy))
                
                Text("Awesome Job!")
                    .font(.title)
                
                Button {
                    model.currentCourseTestSelected = nil
                } label: {
                    Text("Completed")
                }
            }
            
            
        }//Zstack
    }
}


