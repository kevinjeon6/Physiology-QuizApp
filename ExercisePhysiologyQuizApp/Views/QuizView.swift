//
//  QuizView.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/27/22.
//

import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var model: ContentViewModel
    
    @State private var selectedAnswer: Int?
    
    var body: some View {
      
        if model.currentQuestion != nil {
            
            VStack(alignment: .leading) {
                Text("\(model.currentQuestionIndex + 1) of \(model.currentQuiz?.course.test.questions.count ?? 0)")
                    
                    
                
                Text("\(model.currentQuestion?.content ?? "")")
                    
                
                ScrollView {
                    VStack {
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self){
                            index in
                            
                            Button {
                                selectedAnswer = index
                            } label: {
                                ZStack {
                                    Capsule()
                                        .strokeBorder(Color.purple, lineWidth: 4)
                                        .background(selectedAnswer == index ? .gray : .white)
                                        .cornerRadius(20)
                                    
                                    Text("\(model.currentQuestion?.answers[index] ?? "")")
                                        .padding()
                                }
                            }
                            .accentColor(.black)
                            

                        }//ForEach
                    }//Vstack
                }//ScrollView

            }//Vstack
            .navigationBarTitle("\(model.currentQuiz?.category ?? "")")
            .padding(.horizontal, 20)
        } else {
            ProgressView()
        }
   
        
        
    }//body
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(ContentViewModel())
           
    }
}
