//
//  ContentView.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService: FBAuthService
    
    var body: some View {
        Group{
            if authService.user != nil {
                TabBar()
                
            } else {
                SignIn()
            }
        }.onAppear{
            authService.listentoAuthState()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FBAuthService())
    }
}
