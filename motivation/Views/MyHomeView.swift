//
//  HomeView.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI

struct MyHomeView: View {
    @EnvironmentObject var authService: FBAuthService
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        NavigationStack{
            
                VStack{
                    
                    HStack{
                        Button{
                            presentSideMenu.toggle()
                        } label: {
                            Image(systemName: "square.and.arrow.up.fill")
                                .font(.largeTitle)
                        }
                        Spacer()
                    }
                    
                    
                    
                    
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .font(.largeTitle)
                    
                    //Sign Out Button
                    Button {
                        authService.signOut()
                    } label: {
                        Text("Sign Out")
                    }
                }
            
                
          
        }
    }
}

struct MyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyHomeView(presentSideMenu: .constant(false))
    }
}
