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
        
        
        if numberCorrect >= 8 {
           AwesomeView(numberCorrect: numberCorrect)
        } else if numberCorrect >= 6 {
            AverageView(numberCorrect: numberCorrect)
        } else {
           PoorView(numberCorrect: numberCorrect)
        }
        
        
      
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(numberCorrect: 8)
            .environmentObject(ContentViewModel())
    }
}




