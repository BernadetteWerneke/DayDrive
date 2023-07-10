//
//  PersonalDataView.swift
//  motivation
//
//  Created by Bernadette Werneke on 10.07.23.
//

import SwiftUI

struct PersonalDataView: View {
    var body: some View {
        VStack(){
            Text("Set your personal datas here")
                .font(.title2)
                .bold()
            Image("underConstruction")
        }
    }
}

struct PersonalDataView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDataView()
    }
}
