//
//  TimerView.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI

struct TimerView: View {
    @StateObject var fastingManager =  FastingManager()
    
    //Wechsel des Titels je nach Zustand
    var title: String {
        switch fastingManager.fastingState{
        case .notStarted:
            return "Let's get started!"
        case .fasting:
            return "You are now fasting"
      //  case .feeding:
      //      return "You are now feeding"
        }
    }
    
    var body: some View {
    
        VStack(spacing: 40){
            
            //Titel
            Text(title)
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 0.06990530342, green: 0.05029194057, blue: 0.001987644471, alpha: 1)))
            
            //Fasten Intervall
            Text(fastingManager.fastingPlan.rawValue)
                .fontWeight(.semibold)
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                .background(.thinMaterial)
                .cornerRadius(20)
            
            Progressring()
                .environmentObject(fastingManager)
            
            HStack(spacing: 60){
                
                //Start time
                VStack(spacing: 5){
                    Text(fastingManager.fastingState == .notStarted ? "Start" : "Started")
                        .opacity(0.7)
                    Text(fastingManager.startTime, format: .dateTime.weekday().hour().minute().second())
                        .fontWeight(.bold)
                }
                
                //End time
                VStack(spacing: 5){
                    Text(fastingManager.fastingState == .notStarted ? "End" : "Ends")
                        .opacity(0.7)
                    //Datum, Zeitintervall, Zeitangaben
                    Text(fastingManager.endTime, format: .dateTime.weekday().hour().minute().second())
                        .fontWeight(.bold)
                }
            }
            
            //Button
            Button {
                fastingManager.toggleFastingState()
            } label: {
                Text(fastingManager.fastingState == .fasting ? "End fast" : "Start Fasting")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
