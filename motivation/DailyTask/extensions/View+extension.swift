//
//  View+extension.swift
//  motivation
//
//  Created by Bernadette Werneke on 21.07.23.

//  Dieser Codepart des "DateHeaders" mit dazugehörigen Files im Ordner "extensions" ist aus einem youtube-Video entnommen:
//  https://www.youtube.com/watch?v=sbheMzA3jTI&t=1097s
//  SwiftUI - Task Management App - SwiftData - Complex UI - Xcode 15 - SwiftUI Tutorials - Pt 1 von Kavsoft
//  https://www.youtube.com/watch?v=x-LqfOui2-I&t=0s
//  SwiftUI - Task Management App - SwiftData - Complex UI - Xcode 15 - SwiftUI Tutorials - Pt 2
//

import SwiftUI

//custom view extensions
extension View {
    
    //check two dates are same
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
