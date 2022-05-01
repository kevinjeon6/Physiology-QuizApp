//
//  ContentViewModel.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/25/22.
//

import Foundation
import Firebase

class ContentViewModel: ObservableObject {
    
    @Published var quizModules = [Quiz]()
    
    //Current selected Test. Since we have EnvironmentObject, we can use this property to capture the selction in NavigationLink
    @Published var currentCourseTestSelected: Int?
 
    
    
    //What is the current quiz
    @Published var currentQuiz: Quiz?
    var currentQuizIndex = 0
    
    
    @Published var currentQuestion: Questions?
    var currentQuestionIndex = 0
    

    
    init(){
//        getLocalData()
    }
    
    
    
    
    //MARK: - Get Local data
    
//    func getLocalData() {
//        //Create a URL
//
//        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
//
//
//
//        do {
//            //Read the file into a data object
//            let jsonData = try Data(contentsOf: jsonUrl!)
//            let jsonDecoder = JSONDecoder()
//
//           let quizModules = try jsonDecoder.decode([Quiz].self, from: jsonData)
//
//
//            //Assign parsed modules to quizModules property
//            pushToFirebase(quizmodules: quizModules)
//        } catch {
//            print("Couldn't parse local data")
//        }
//
//    }
    
    
    func beginQuizModule(_ moduleid: Int){
        
       
        //Need to loop through Quiz array
        for index in 0..<quizModules.count {
            if quizModules[index].id == moduleid {
                currentQuizIndex = index
                break
            }
        }
        
        currentQuiz = quizModules[currentQuizIndex]
        
        currentQuestionIndex = 0
        
        if currentQuiz?.course.test.questions.count ?? 0 > 0 {
            currentQuestion = currentQuiz!.course.test.questions[currentQuestionIndex]
        }
    }
    
    
    func nextQuestion(){
        
        currentQuestionIndex += 1
        
        if currentQuestionIndex < currentQuiz!.course.test.questions.count {
            currentQuestion = currentQuiz!.course.test.questions[currentQuestionIndex]
            
        } else {
            currentQuestion = nil
            currentQuestionIndex = 0
        }
    }
    
    
    //MARK: - Firebase Methods

    
    
    func pushToFirebase(quizmodules: [Quiz]){
        let db = Firestore.firestore()
        
        let firebaseModules = db.collection("quizmodules")
        
        for quiz in quizmodules {
            let course = quiz.course
            let test = quiz.course.test
            
            let firebaseModule = firebaseModules.addDocument(data: ["category": quiz.category])
            
            firebaseModule.updateData(["id": firebaseModule.documentID,
                                       "course": ["id": firebaseModule.documentID,
                                        "image": course.image,
                                                  "description": course.description,
                                                  
                                        ],
                                       "test": [
                                        "id": firebaseModule.documentID,
                                        "questions": test.questions.count
                                       ]
                                      ])
            
            
            
            
            for question in test.questions {
                let firebaseQuestion = firebaseModule.collection("questions").addDocument(data: ["content": question.content,
                                                                                                 "correctIndex": question.correctIndex,
                                                                                                 "answers": question.answers
                                                                                                 
                ])
                
                firebaseQuestion.updateData(["id": firebaseQuestion.documentID])
            }
            
        }
    }
    

    func getFirebaseQuestions(modeule: Quiz){
        let db = Firestore.firestore()
        
        let firebaseModules = db.collection("quizmodules").document("questions")
    }
    
}
