//
//  QAView.swift
//  motivation
//
//  Created by Bernadette Werneke on 10.07.23.
//

import SwiftUI

struct QAView: View {
    var body: some View {
        VStack{
            Text("Q&A")
                .font(.largeTitle)
                .bold()
            Image("underConstruction")
        }
    }
}

struct QAView_Previews: PreviewProvider {
    static var previews: some View {
        QAView()
    }
}
