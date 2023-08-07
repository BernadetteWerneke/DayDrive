//
//  TimerView.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI

struct TimerView: View {
    @StateObject var fastingManager =  FastingManager()
    @StateObject var taskvm = DailyTaskViewModel()
    
    //Wechsel des Titels je nach Zustand
    var title: String {
        switch fastingManager.fastingState{
        case .notStarted:
            return "Let's get started!"
        case .fasting:
            return "You are now fasting"
        }
    }
    
    var body: some View {
    
        VStack(spacing: 40){
            
            //Titel
            Text(title)
                .font(.headline)
            
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
                //fasting time speichern nur wenn 0 (d.h. ein neuer Tag) ist
                if (taskvm.saveCurrentDay.fastingTime == 0) {
                    taskvm.saveDailyFastingTime(fastingTime: fastingManager.elapsedTime)
                    print("123TimerView info: fastingTime is Null, it is a new day, saving ")
                } else  {
                    print("123TimerView info: fastingTime is not Null, not a new day, no saving ")
                }
                
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
