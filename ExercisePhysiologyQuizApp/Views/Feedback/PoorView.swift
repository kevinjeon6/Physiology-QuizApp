//
//  PoorView.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 5/1/22.
//

import SwiftUI

struct PoorView: View {
    @EnvironmentObject var model: ContentViewModel
    
    var numberCorrect: Int
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Text("\(numberCorrect) out of \(model.currentQuiz?.course.test.questions.count ?? 0)")
                    .font(.system(size: 50, weight: .heavy))
                
                Text("You should study more")
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


