//
//  motivationApp.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI
import Firebase

@main
struct motivationApp: App {
    @StateObject var authService = FBAuthService()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authService)
        }
    }
}
