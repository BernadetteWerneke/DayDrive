//
//  StepCard.swift
//  motivation
//
//  Created by Bernadette Werneke on 13.07.23.
//

import SwiftUI

struct StepCard: View {
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
                
                VStack{
                    Text("\(taskvm.saveCurrentDay.dailySteps) steps")
                        .font(.title3)
                    
                    HStack{
                        
                        //Minnus-Button
                        Button{
                            newStepsInt = Int(newSteps) ?? 0
                            totalNewSteps = Int(taskvm.saveCurrentDay.dailySteps) - newStepsInt
                            if(totalNewSteps <= 0){
                                totalNewSteps = 0
                            }
                            //Steps speichern
                            taskvm.saveDailySteps(steps: Int(totalNewSteps))
                            //Textfiled leeren
                            newSteps = ""
                        } label: {
                            Image(systemName: "minus.circle")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.yellow)
                                .background(.white)
                                .cornerRadius(17)
                        }
                        .padding(.trailing)
                        
                        //manuelle Eingabe der Schritte
                        TextField("Enter steps...", text: $newSteps)
                            //.keyboardType(.numberPad)       //Zahlenkeyboard
                            .frame(width: 150, height: 10.0)
                            .padding()
                            .background(.white)
                            .cornerRadius(15)
                       
                        
                        //Plus-Button
                        Button{
                            newStepsInt = Int(newSteps) ?? 0
                            totalNewSteps = newStepsInt + Int(taskvm.saveCurrentDay.dailySteps)
                            //Steps speichern
                            taskvm.saveDailySteps(steps: Int(totalNewSteps))
                            //Textfeld leeren
                            newSteps = ""
                           
                        } label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .background(.white)
                                .cornerRadius(17)
                                .foregroundColor(.yellow)
                        }
                        .padding(.leading)
                        
                    }
                }
            }.padding()
        }
    }
}

struct StepCard_Previews: PreviewProvider {
    static var previews: some View {
        StepCard()
    }
}
