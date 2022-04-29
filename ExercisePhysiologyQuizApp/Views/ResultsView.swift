//
//  ResultsView.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/29/22.
//

import SwiftUI

struct ResultsView: View {
    
    @EnvironmentObject var model: ContentViewModel
    
    var numberCorrect: Int
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Text("\(numberCorrect) out of \(model.currentQuiz?.course.test.questions.count ?? 0)")
                    .font(.system(size: 50, weight: .heavy))
                
                Text("Awesome")
                    .font(.title)
                
                Button {
                    model.currentCourseTestSelected = nil
                } label: {
                    Text("Completed")
                }
            }
           

        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(numberCorrect: 3)
            .environmentObject(ContentViewModel())
    }
}
