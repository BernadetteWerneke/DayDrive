//
//  WaterCard.swift
//  motivation
//
//  Created by Bernadette Werneke on 13.07.23.
//

import SwiftUI

struct WaterCard: View {
    
   // @StateObject var dayvm = TaskVM()
    @State private var waterValue : Float = 0.0             //Wasserangabe
    @State private var totalWaterValue: Float = 0.0
    
    var body: some View {
        ZStack{
            Color.yellow.opacity(0.1)
                .cornerRadius(15)
            
            VStack{
                VStack{
                    
                    //Header
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
                       
                    //aktuelle Wasseranzeige aufsummiert
                    Text("\(totalWaterValue, specifier: "%.1f") l")
                        .font(.title3)
                            
                    //Slider zum Wählen der Wasserangabe mit Aktualisierung (+/-Button)
                    VStack{
                        HStack{
                            
                            //Minus Button
                            Button{
                                totalWaterValue -= waterValue
                                if(totalWaterValue <= 0.0){
                                    totalWaterValue = 0.0
                                }
                                //SliderValue auf null setzen
                                waterValue = 0.0
                          
                            } label: {
                                Image(systemName: "minus.circle")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.yellow)
                            }
                                
                            //Slider
                            Slider(value: $waterValue, in: 0.0...3.0)
                                .frame(width: 180,height: 40)       //Höhe des Sliders einstellen
                                .tint(.yellow)
        
                            //zeigt aktuelle WasserValue in 0,1l-Schritten an
                            Text("\(waterValue, specifier: "%.1f") l")
                                .font(.title3)
                                .foregroundColor(.gray)
                                   
                            Button{
                                totalWaterValue += waterValue
                                //SliderValue auf null setzen
                                waterValue = 0.0
                            } label: {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .cornerRadius(15)
                                    .foregroundColor(.yellow)
                            }
                        }
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                   
                        }
                    }
                }
                .padding()
            }
        }
    }


struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterCard()
    }
}
