//
//  HomeView.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.07.23.
//

import SwiftUI

struct HomeView: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
            VStack{
                HStack{
                    Button{
                        presentSideMenu.toggle()
                    } label: {
                        Image(systemName: "list.bullet")
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
                Text("Home View")
                Spacer()
            }
            .padding(.horizontal, 24)
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presentSideMenu: .constant(false))
    }
}
