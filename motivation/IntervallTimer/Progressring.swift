//
//  Progressring.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI
import SwiftUI

//ProgressRing mit verstrichener und verbliebener Zeit
struct Progressring: View {
    @EnvironmentObject var fastingManager: FastingManager
    //@State var progress = 0.0
    
    //timer publisher (api)
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
           //Platzhalter
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            //ProgressRing
            Circle()
                .trim(from: 0.0, to: min(fastingManager.progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.7524592876, blue: 0, alpha: 1))]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0), value: fastingManager.progress)
            
            
            VStack(spacing: 30){
                if fastingManager.fastingState == .notStarted {
                    //Kommendes Fasten
                    VStack(spacing: 5){
                        Text("Upcoming fast")
                            .opacity(0.7)
                        Text("\(fastingManager.fastingPlan.fastingPeriod.formatted()) Hours")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                } else {
                    //verstrichene Zeit
                    VStack(spacing: 5){
                        Text("Elapsed time (\(fastingManager.progress.formatted(.percent)))")
                            .opacity(0.7)
                        Text(fastingManager.startTime, style: .timer)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding(.top)
                    
                    //verbliebene Zeit
                    VStack(spacing: 5){
                        if !fastingManager.elapsed {
                            Text("Remaining time (\((1 - fastingManager.progress).formatted(.percent)))")
                                .opacity(0.7)
                        } else {
                            Text("Extra time")
                                .opacity(0.7)
                        }
                        Text(fastingManager.endTime, style: .timer)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
             
            }
        }
        .frame(width: 250, height: 250)
        .padding()
//        .onAppear{
//            fastingManager.progress = 1
//        }
        .onReceive(timer) { _ in
            fastingManager.track()
        }
        
    }
}

struct Progressring_Previews: PreviewProvider {
    static var previews: some View {
        Progressring()
            .environmentObject(FastingManager())
    }
}
