//
//  SignUp.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI

struct SignUp: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @Environment(\.dismiss) var dismiss //verwerfen, zurück zum SignIn View
    @EnvironmentObject var authService: FBAuthService
    
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
                    
                    Text("Create Account")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design:  .rounded))
                        .padding(.top, 20)
                        .offset(y: 160)
                    
                   Spacer()
                  
                    //EingabeFeld fullName
                    HStack{
                        Image(systemName: "pencil")
                            .foregroundColor(.gray)
                        TextField("Full Name", text: $fullName)
                        
                        if (fullName.count != 0) {
                            Image(systemName: "checkmark")
                                .fontWeight(.bold)
                                .foregroundColor(.yellow)
                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.yellow)
                    )
                    .padding(.top, 80)
                    
                    //EingabeFeld email
                    HStack{
                        Image(systemName: "tray")
                            .foregroundColor(.gray)
                        TextField("Email", text: $email)
                            .autocapitalization(.none) //nur Kleinbuchstaben
                    
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.yellow)
                    )
                    .padding(.top, 15)
                    
                    //EingabeFeld Passwort
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.yellow)
                    )
                    .padding(.top, 15)
                    
                    //sign Up button
                    HStack{
                        Spacer()
                        Button {
                            authService.signUp(emailAdress: email, password: password)
                        } label: {
                            Text("SIGN UP")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                                .frame(width: 150)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15)
                                    .fill(.yellow))
                                .padding(.top, 20)
                        }
                        Spacer()
                    }
                    
                    
                    //wechseln zu SignIn View
                    Button  {
                        dismiss()
                        //SignIn()
                    } label: {
                        HStack{
                            Text("Already have an account?")
                                .foregroundColor(.gray)
                                .font(.title2)
                            Text("SIGN IN")
                                .foregroundColor(.yellow)
                                .font(.system(size: 22, weight: .bold, design:  .rounded))
                        }.padding(.top, 100)
                    }
                    
                }
                .frame(width: 350)
                .padding(.vertical,35)
            }.ignoresSafeArea()
        }
    }
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
