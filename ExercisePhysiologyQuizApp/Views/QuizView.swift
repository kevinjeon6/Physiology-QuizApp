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
    @State private var numberCorrect = 0
    @State private var isSubmitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack(alignment: .leading) {
                Text("\(model.currentQuestionIndex + 1) of \(model.currentQuiz?.course.test.questions.count ?? 0)")
                    .padding(.bottom, 10)
                
                
                
                Text("\(model.currentQuestion?.content ?? "")")
                
               
                //Answers
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
                                        .foregroundColor(.black)
                                }
                            }
                            .disabled(isSubmitted)
                           
                            
                            
                        }//ForEach
                    }//Vstack
                }//ScrollView
                
                
                
                
                //Submit/Next/Finish Button
                Button {
                    isSubmitted.toggle()
                    
                    if selectedAnswer == model.currentQuestion!.correctIndex {
                        numberCorrect += 1
                    }
                } label: {
                    ZStack {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 4)
                            .background(Capsule().fill(Color.blue))
                            .frame(height: 50)
                     
                        
                        Text("Submit")
                            .padding()
                            .foregroundColor(.white)
                    }
                }
                .disabled(selectedAnswer == nil)
              
                
                
            }//Vstack
            .navigationBarTitle("\(model.currentQuiz?.category ?? "")")
            .padding(.horizontal, 20)
        } else {
            ProgressView()
        }
        
        
        
    }//body
}

//struct QuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizView()
//            .environmentObject(ContentViewModel())
//
//    }
//}
