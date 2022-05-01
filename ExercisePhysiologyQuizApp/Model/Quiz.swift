//
//  Quiz.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/25/22.
//

import Foundation


struct Quiz: Decodable, Identifiable {
    
    var id: String = ""
    var category: String = ""
    var course: Course = Course()
}


struct Course: Decodable, Identifiable {
    var id: String = ""
    var image: String = ""
    var description: String = ""
    var test: Test = Test()
}


struct Test: Decodable, Identifiable {
    var id: String = ""
    var questions: [Questions] = [Questions]()
}

struct Questions: Decodable, Identifiable {
    var id: String = ""
    var content: String = ""
    var correctIndex: Int = 0
    var answers: [String] = [String]()
}
