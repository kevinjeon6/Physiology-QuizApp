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
    @Published var currentCourseSelected: Int?
    

    
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
}
