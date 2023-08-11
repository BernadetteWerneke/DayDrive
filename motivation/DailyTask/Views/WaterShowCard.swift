//
//  WaterShowCard.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.08.23.
//

import SwiftUI

struct WaterShowCard: View {
    @StateObject var taskvm = DailyTaskViewModel()
    @State private var waterValue : Float = 0.0             //Wasserangabe
    @State private var totalWaterValue: Float = 0.0         //Wasserangabe gesamt
    
    
    var body: some View {
        ZStack{
            Color.yellow.opacity(0.1)
                .cornerRadius(15)
            
            VStack{
                VStack{
                    
                    VStack(alignment: .leading){
                        HStack{
                            //Titel
                            Text("Daily water")
                                .font(.title2)
                            Spacer()
                            //Image Walker
                            Image(systemName: "mug.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.yellow)
                            
                        }
                        Text("Goal: 2 l")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                    //dailyWater anzeigen
                    Text("x,x l")
                   // Text("\(taskvm.saveCurrentDay.dailyWater, specifier: "%.1f") l")
                        .font(.title3)
            
                }
            }
            .padding()
        }
    }
}



struct WaterShowCard_Previews: PreviewProvider {
    static var previews: some View {
        WaterShowCard()
    }
}
