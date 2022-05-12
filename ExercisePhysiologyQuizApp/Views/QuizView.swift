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
    @State var progressValue: Float = 0.10
    
    var buttonText: String {
        if isSubmitted == true {
            
            if model.currentQuestionIndex + 1 == model.currentQuiz!.course.test.questions.count {
                return "Finish"
            } else {
                return "Next Question"
            }
        } else {
            return "Submit"
        }
    }
    
    
    func progressIncrement(){
        
        if progressValue < 1.0 {
            //1.0 represents 100%
            self.progressValue += 0.10
        } else {
            progressValue = 0.0
        }
    }
    
    
    var body: some View {
        if model.currentQuestion != nil {
            
            VStack(alignment: .leading) {
                
                Text("\(model.currentQuestionIndex + 1) of \(model.currentQuiz?.course.test.questions.count ?? 0)")
                    .padding(.bottom, 10)
                
                ProgressionBar(progressAmount: $progressValue)
                    .frame(height: 20)
                
               Spacer()
                
                Text("\(model.currentQuestion?.content ?? "")")
                
            
           
               
                //Answers
                
             Spacer()
                   
                    VStack {
                          
                            ForEach(0..<model.currentQuestion!.answers.count, id: \.self){
                                index in
                                
                                Button {
                                    selectedAnswer = index
                                    
                                    
                                } label: {
                                    ZStack {
                                        
                                        if isSubmitted == false {
                                            Capsule()
                                                .strokeBorder(Color.purple, lineWidth: 4)
                                                .background(
                                                    Capsule()
                                                        .fill(selectedAnswer == index ? .gray : .blue))
                                                .modifier(ButtonModifier())
                                        } else {
                                            if index == selectedAnswer && index == model.currentQuestion!.correctIndex {
                                                Capsule()
                                                    .strokeBorder(Color.purple, lineWidth: 4)
                                                    .background(
                                                        Capsule()
                                                            .fill(.green)
                                                    )
                                                    .modifier(ButtonModifier())
                                            } else if index == selectedAnswer && index != model.currentQuestion!.correctIndex {
                                                Capsule()
                                                    .strokeBorder(Color.purple, lineWidth: 4)
                                                    .background(
                                                        Capsule()
                                                            .fill(.red))
                                                    .modifier(ButtonModifier())
                                            }  else if index == model.currentQuestion!.correctIndex {
                                                Capsule()
                                                    .strokeBorder(Color.purple, lineWidth: 4)
                                                    .background(
                                                        Capsule()
                                                            .fill(.green))
                                                    .modifier(ButtonModifier())
                                            } else {
                                                Capsule()
                                                    .strokeBorder(Color.purple, lineWidth: 4)
                                                    .background(
                                                        Capsule()
                                                            .fill(.blue))
                                                    .modifier(ButtonModifier())
                                            }

                                        }
                                        
                                        Text("\(model.currentQuestion?.answers[index] ?? "")")
                                            .ButtonTextStyle()
                                    }
                                }
                                .disabled(isSubmitted)
                               
                                
                                
                            }//ForEach
                    }//Vstack
                    .padding(.bottom, 20)
               
                
                
                
               
                
                //Submit/Next/Finish Button
                Button {
                    
                    if isSubmitted == true {
                        model.nextQuestion()
                        progressIncrement()
                        //Resent properties
                        isSubmitted = false
                        selectedAnswer = nil
                        } else {
                            
                            isSubmitted.toggle()
                            
                            if selectedAnswer == model.currentQuestion!.correctIndex {
                                numberCorrect += 1
                        }
                        
                    }
                  
                   
                    
                } label: {
                    ZStack {
                        Capsule()
                            .strokeBorder(Color.orange, lineWidth: 4)
                            .background(Capsule().fill(Color.blue))
                            .frame(height: 50)
                     
                        
                        Text(buttonText)
                            .ButtonTextStyle()
                    }
                }
                .disabled(selectedAnswer == nil)
                .padding(.bottom, 10)
              
                
                
            }//Vstack
            .navigationBarTitle("\(model.currentQuiz?.category ?? "")")
            .padding(.horizontal, 20)
        } else {
            ResultsView(numberCorrect: numberCorrect)
//            ProgressView()
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
