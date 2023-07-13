//
//  TimeCard.swift
//  motivation
//
//  Created by Bernadette Werneke on 13.07.23.
//

import SwiftUI

struct TimeCard: View {
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
            
                Text("16,3 hours")
                    .font(.title3)
            }.padding()
        }
    }
}

struct TimeCard_Previews: PreviewProvider {
    static var previews: some View {
        TimeCard()
    }
}
