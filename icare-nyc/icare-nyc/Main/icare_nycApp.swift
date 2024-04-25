//
//  icare_nycApp.swift
//  icare-nyc
//
//  Created by Aryana Mohammadi on 4/23/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

@main
struct icare_nycApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavBarView()
        }
    }
}
