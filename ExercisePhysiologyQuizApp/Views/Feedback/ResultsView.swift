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
            
            VStack (spacing: 10) {
                Text("\(numberCorrect) out of \(model.currentQuiz?.course.test.questions.count ?? 0)")
                    .font(.system(size: 50, weight: .heavy))
                    .foregroundColor(.white)
                
                Text(resultsText)
                    .font(.title)
                    .foregroundColor(.white)
                
                Button {
                    model.currentCourseTestSelected = nil
                  
                } label: {
                    Text("Complete")
                        .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 200, height: 50)
                )

            }
            
        }
        
      
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(numberCorrect: 8)
            .environmentObject(ContentViewModel())
    }
}




