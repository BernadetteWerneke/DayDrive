//
//  TaskView.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import SwiftUI
@EnvironmentObject var authService: FBAuthService

struct TaskView: View {
    var body: some View {
        VStack{
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
           
                Button {
                    authService.signOut()
                } label: {
                   Text("Sing Out")
                }
            }
        }
    }

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
