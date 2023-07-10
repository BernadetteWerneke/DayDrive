//
//  DoshaTestView.swift
//  motivation
//
//  Created by Bernadette Werneke on 10.07.23.
//

import SwiftUI

struct DoshaTestView: View {
    var body: some View {
        VStack(){
            Text("Make your Dosha Test here")
                .font(.title2)
                .bold()
            Image("underConstruction")
        }
    }
}

struct DoshaTestView_Previews: PreviewProvider {
    static var previews: some View {
        DoshaTestView()
    }
}
