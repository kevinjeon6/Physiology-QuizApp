//
//  Quiz.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/25/22.
//

import Foundation


struct Quiz: Decodable, Identifiable {
    
    var id: Int
    var category: String
    var course: Course
}


struct Course: Decodable, Identifiable {
    var id: Int
    var image: String
    var description: String
    var test: Test
}


struct Test: Decodable, Identifiable {
    var id: Int
    var questions: [Questions]
}

struct Questions: Decodable, Identifiable {
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}
