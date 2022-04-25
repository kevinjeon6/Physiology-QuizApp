//
//  ContentViewModel.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/25/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var quizModules = [Quiz]()
    

    
    init(){
        getLocalData()
    }
    
    
    
    
    //MARK: - Get Local data
    
    func getLocalData() {
        //Create a URL
        
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
       
        
        do {
            //Read the file into a data object
            let jsonData = try Data(contentsOf: jsonURL!)
            let jsonDecoder = JSONDecoder()
            
            let quizModules = try jsonDecoder.decode([Quiz].self, from: jsonData)
            
            //Assign parsed modules to quizModules property
            self.quizModules = quizModules
        } catch {
            print(error)
        }
    }
}
