//
//  FBAuthService.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI
import FirebaseAuth


class FBAuthService: ObservableObject {
    
    var user: User? {
        didSet{
            objectWillChange.send()
        }
    }
    
    func listentoAuthState(){
        Auth.auth().addStateDidChangeListener { _, user in
            self.user = user
        }
    }
    
    
    func signIn(emailAdress: String, password: String) {
        Auth.auth().signIn(withEmail: emailAdress, password: password) {result, error in
            if let error = error {
                print("DEBUG: signIn failed \(error.localizedDescription)")
            }
        }
    }
    
    
    //func signUp(emailAdress: String, password: String, fullname: String) {
    func signUp(emailAdress: String, password: String) {                                        //TODO fullname-------------------------
        Auth.auth().createUser(withEmail: emailAdress, password: password) {result, error in
            if let error = error {
                print("DEBUG: Failed to create user with error \(error.localizedDescription)")
            }
        }
    }

    
    func signOut() {
        do{
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: signOut failed \(error)")
        }
    }
    
    func deleteAccount() {}
    
    func fetchUser() {}
}

