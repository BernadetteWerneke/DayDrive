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
                   
                }
                DateHeader()
                TimeCard()
                WaterCard()
                StepCard(newSteps: $newSteps)
            }
        }
    
    }
}


struct MyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyHomeView()
    }
}
