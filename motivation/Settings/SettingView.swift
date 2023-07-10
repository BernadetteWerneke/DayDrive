//
//  SettingView.swift
//  motivation
//
//  Created by Bernadette Werneke on 10.07.23.
//


import SwiftUI

struct SettingView: View {

    
    var body: some View {
        NavigationStack{
                
                VStack(alignment: .center) {
                    
                    //Profilbild
                    Image("Minion")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .background(.white)
                        .clipShape(Circle())
                        .overlay(){
                            Circle().stroke(.gray, lineWidth:4)
                        }
                        .shadow(radius: 7)
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                    
                    //Name unter Profilbild
                    Text("Minion")
                        .font(.system(size: 20))
                        .padding(.bottom, 20)
                }
                .padding(.bottom, 10)
         
                
            List{
                
                Section{
                    NavigationLink(destination: FastingDataView()) {
                        Text("Fasting Data")
                    }
                    NavigationLink(destination: PersonalDataView()) {
                        Text("Personal Data")
                    }
                }
                
                Section{
                    NavigationLink(destination: DoshaTestView()) {
                        Text("Dosha Test")
                    }
                }
                
                Section{
                    NavigationLink(destination: QAView()) {
                        Text("Q&A")
                    }
                }
                    
                }.navigationTitle("Settings")
                Spacer()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
