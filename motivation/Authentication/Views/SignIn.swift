//
//  SignIn.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI

struct SignIn: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authsService: FBAuthService
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                //gelber Hintergrund
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 550)
                    .rotationEffect(.degrees(165))
                    .offset(y: -400)
                
                
                
                VStack(alignment: .leading){
                    
                    //LoginTexte
                    Text("Welcome!")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design:  .rounded))
                        .padding(.top, 95)
                    
                    
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design:  .rounded))
                        .padding(.top, 20)
                    
                    
                    Text("to your account")
                        .foregroundColor(.white)
                        .font(.system(size: 25, design:  .rounded))
                        .padding(.top, -20)
                    
                    
                    //EingabeFeld Login: Email
                    HStack{
                        
                        Image(systemName: "tray")
                            .foregroundColor(.gray)
                        TextField("Email", text: $email)
                            .autocapitalization(.none) //nur Kleinbuchstaben in Mailadresse
                        
                        Spacer()
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.yellow)
                    )
                    .padding(.top, 80)
                    
                    //EingabeFeld Passwort
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        SecureField("Password", text: $password)
                        
                        Spacer()
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.yellow)
                    )
                    .padding(.top)
                    
                    //sign In button
                    HStack{
                        Spacer()
                        Button {
                            authsService.signIn(emailAdress: email, password: password)
                        } label: {
                            Text("SIGN IN")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                                .frame(width: 150)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15)
                                    .fill(.yellow))
                                .padding(.top, 40)
                        }
                        Spacer()
                    }
                    
                    //signUp button + wechseln zur Registrierung
                    NavigationLink {
                        SignUp()
                            .navigationBarBackButtonHidden(true) //Backbutton verschwindet
                    } label: {
                        HStack(spacing: 22){
                            Text("Don't have an account?")
                                .foregroundColor(.gray)
                                .font(.title2)
                            Text("SIGN UP")
                                .foregroundColor(.yellow)
                                .font(.system(size: 22, weight: .bold, design:  .rounded))
                            
                        }.padding(.top, 160)
                    }
                }
                .frame(width: 350)
                .padding(.vertical,15)
            }.ignoresSafeArea()
        }
    }
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
