//
//  SideMenuView.swift
//  motivation
//
//  Created by Bernadette Werneke on 07.07.23.
//

import SwiftUI

struct SideMenuView: View {
    @State var showSideMenu: Bool = false
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title2)
            
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
