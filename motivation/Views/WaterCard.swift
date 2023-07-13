//
//  WaterCard.swift
//  motivation
//
//  Created by Bernadette Werneke on 13.07.23.
//

import SwiftUI

struct WaterCard: View {
    @Binding var waterValue : Double
    
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
                        Text("1.3 l")
                            .font(.title3)
                            
                        VStack{
                            HStack{
                                
                                Button{
                                    //action
                                } label: {
                                    Image(systemName: "minus.circle")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(.yellow)
                                }
                                
                                Slider(value: $waterValue, in: 0.0...3.0)
                                    .frame(width: 180,height: 40)       //Höhe des Sliders einstellen
                                    .tint(.yellow)
                                //zeigt aktuelle WasserValue an
                                Text("\(waterValue, specifier: "%.1f") l")
                                    .font(.title3)
                                    .foregroundColor(.gray)
                                   
                                Button{
                                    //action
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

struct WaterCard_Previews: PreviewProvider {
    static var previews: some View {
        WaterCard(waterValue: .constant(1.2))
    }
}
