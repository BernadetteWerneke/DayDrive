//
//  TimeShowCard.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.08.23.
//

import SwiftUI

struct TimeShowCard: View {
    @StateObject var taskvm = DailyTaskViewModel()
    
    var body: some View {
        ZStack{
            Color.yellow.opacity(0.1)
                .cornerRadius(15)
            VStack{
                VStack(alignment: .leading){
                    HStack{
                        //Titel
                        Text("Fasting time")
                            .font(.title2)
                        Spacer()
                        //Image Walker
                        Image(systemName: "hourglass.bottomhalf.filled")
                            .resizable()
                            .frame(width: 25, height: 30)
                            .foregroundColor(.yellow)
                    }
                
                    Text("Goal: 16 h")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
            
                //total fasting time anzeigen
                Text("xx,x h")
               // Text("\(String(format: "%.1f", taskvm.saveCurrentDay.fastingTime)) hours" )  //fastingManager.elapsedTime
                    .font(.title3)
            }.padding()
        }
    }
}

struct TimeShowCard_Previews: PreviewProvider {
    static var previews: some View {
        TimeShowCard()
    }
}
