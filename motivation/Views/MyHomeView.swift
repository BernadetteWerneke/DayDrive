//
//  HomeView.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI

struct MyHomeView: View {
    //für SignOut
    @EnvironmentObject var authService: FBAuthService
    @State var waterValue: Double = 0.0
    
    var body: some View {
        NavigationStack{
            
            VStack{
                //Sign Out Button
                Button {
                    authService.signOut()
                } label: {
                    Text("Sign Out")
                }
                TimeCard()
                WaterCard(waterValue: $waterValue)
                StepCard()
                
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
            }.navigationTitle("Daily Task")
        }
    
    }
}


struct MyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyHomeView()
    }
}
