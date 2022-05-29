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
    
    
    var resultsText: String {
        if numberCorrect >= 8 {
            return "Awesome Job!"
        } else if numberCorrect >= 6 {
            return "Not bad. I think you can do better!"
        } else {
            return "You should study more"
        }
    }
    
    var body: some View {
        
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()
            
            VStack (spacing: 30) {
               
                Text("\(numberCorrect) out of \(model.currentQuiz?.course.test.questions.count ?? 0)")
                    .font(.system(size: 50, weight: .heavy))
                    .foregroundColor(.white)
            
                Text(resultsText)
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
               
                Button {
                    model.currentCourseTestSelected = nil
                  
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 200, height: 50)
                        Text("Complete")
                            .padding()
                    }
                }
               
                

            }
            
        }
        
      
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(numberCorrect: 7)
            .environmentObject(ContentViewModel())
    }
}




