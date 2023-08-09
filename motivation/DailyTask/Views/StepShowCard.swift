//
//  StepShowCard.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.08.23.
//

import SwiftUI

struct StepShowCard: View {
    @StateObject var taskvm = DailyTaskViewModel()
    @State var newSteps: String = ""
    @State private var newStepsInt: Int = 0
    @State private var totalNewSteps: Int = 0
    
    var body: some View {
        ZStack{
            Color.yellow.opacity(0.1)
                .cornerRadius(15)
            VStack{
                VStack(alignment: .leading){
                    HStack{
                        //Titel
                        Text("Daily steps")
                            .font(.title2)
                        Spacer()
                        //Image Walker
                        Image(systemName: "figure.walk")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                    }
                    Text("Goal: 10,000")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                
               Text("12.567 steps")
                   // Text("\(taskvm.saveCurrentDay.dailySteps) steps")
                        .font(.title3)
                    
                 
                
            }.padding()
        }
    }
}

struct StepShowCard_Previews: PreviewProvider {
    static var previews: some View {
        StepShowCard()
    }
}
