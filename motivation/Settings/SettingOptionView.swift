//
//  SettingOptionView.swift
//  motivation
//
//  Created by Bernadette Werneke on 10.07.23.
//

import SwiftUI

struct SettingOptionView: View {
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .frame(width: 24, height: 24)
                .foregroundColor(.black)
            
            Text(vm.title)
                //.font(.system(size: 20, weight: .medium))
                .font(.system(size: 20))
                .foregroundColor(.black)
        }
        .padding()
    }
}

struct SettingOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SettingOptionView()
    }
}
