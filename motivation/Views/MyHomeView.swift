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
    @State var newSteps: String = ""
    
    var body: some View {
        NavigationStack{
            
            VStack{
                HStack{
                    Spacer()
                    //Sign Out Button
                    Button {
                        authService.signOut()
                    } label: {
                        Image(systemName: "power.circle.fill")
                            .font(.largeTitle)
                    }
                }
                    TimeCard()
                    WaterCard()
                    StepCard(newSteps: $newSteps)
                
            }.navigationTitle("Daily Task")
        }
    
    }
}


struct MyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyHomeView()
    }
}
