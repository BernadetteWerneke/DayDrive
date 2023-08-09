//
//  HomeView.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI

struct MyHomeView: View {
    
    @EnvironmentObject var authService: FBAuthService   //für SignOut
    @State var waterValue: Double = 0.0
    @State var newSteps: String = ""
    
    var body: some View {
        
        VStack{
            DateHeader()
            TimeCard()
            WaterCard()
            StepCard()
        }
    }
}



struct MyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyHomeView()
    }
}
