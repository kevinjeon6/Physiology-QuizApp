//
//  ContentViewModel.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/25/22.
//

import Foundation

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
        getLocalData()
    }
    
    
    
    
    //MARK: - Get Local data
    
    func getLocalData() {
        //Create a URL
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
  
        
        do {
            //Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            
           let quizModules = try jsonDecoder.decode([Quiz].self, from: jsonData)
  
        
            //Assign parsed modules to quizModules property
            self.quizModules = quizModules
        } catch {
            print("Couldn't parse local data")
        }
       
    }
    
    
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
    
    

    
}
