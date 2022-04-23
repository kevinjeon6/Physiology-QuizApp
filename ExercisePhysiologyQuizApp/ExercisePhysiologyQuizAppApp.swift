//
//  ExercisePhysiologyQuizAppApp.swift
//  ExercisePhysiologyQuizApp
//
//  Created by Kevin Mattocks on 4/22/22.
//

import SwiftUI
import Firebase

@main
struct ExercisePhysiologyQuizAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
