//
//  FastingManager.swift
//  motivation
//
//  Created by Bernadette Werneke on 06.07.23.
//

import Foundation

enum FastingState {
    case notStarted
    case fasting
    case feeding
}

//Fastenintervalle 1.Anfänger, 2.Mittel, 3.Fortgeschritten
enum FastingPlan: String {
    case beginner = "12:12"
    case intermediate = "16:8"
    case advanced = "20:4"
    
    //Intervalle in Stunden
    var fastingPeriod: Double {
        switch self {
        case .beginner:
            return 12
        case .intermediate:
            return 16
        case .advanced:
            return 20
        }
    }
    
}

class FastingManager: ObservableObject {
    @Published private(set) var fastingState: FastingState = .notStarted
    @Published private(set) var fastingPlan: FastingPlan = .intermediate
    @Published private(set) var startTime: Date {
        didSet {
            print("startTime", startTime.formatted(.dateTime.month().day().hour().minute().second()))
            if fastingState == .fasting {
                endTime = startTime.addingTimeInterval(fastingTime)
            } else {
                endTime = startTime.addingTimeInterval(feedingTime)
            }
        }
    }
    @Published private(set) var endTime: Date {
        didSet {
            print("endTime", endTime.formatted(.dateTime.month().day().hour().minute().second()))
        }
    }
    @Published private(set) var elapsed: Bool = false //Timer zählt ExtraTime, wenn endTime erreicht (ProgressRing)
    //gemeinsame Anzeige: Prozentangaben plus Progressring, gleicher Fortschritt
    @Published private(set) var elapsedTime: Double = 0.0
    @Published private(set) var progress: Double = 0.0
    
    //MARK Testzeit, Echtzeit
    //Essenszeit ist das Gegenteil von Fastenzeit
    var fastingTime: Double {
        //*********************************************************************************** !!!!!!!!16 sec vs Echtzeit !!!!!!!!!!****************************************
        return fastingPlan.fastingPeriod      //für Testzwecke Intervall auf 16 sec stellen *******************************************************************************
       // return fastingPlan.fastingPeriod * 60 * 60       //dies ist Echtzeit!!!!
    }
    var feedingTime: Double {
        return 24 - fastingPlan.fastingPeriod     //für Testzwecke Intervall umstellen
        //return (24 - fastingPlan.fastingPeriod) * 60 * 60   //dies ist Echtzeit!!!!**************************************************************************************
    }
    
    init() {
        let calendar = Calendar.current
        
/*      var components = calendar.dateComponents([.year, .month, .day, .hour], from: Date())
        components.hour = 20
        print(components)
        
        let scheduledTime = calendar.date(from: components) ?? Date.now
        print("scheduledTime" , scheduledTime.formatted(.dateTime.month().day().hour().minute().second()))
 */
        let components = DateComponents(hour: 20)
        let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        print("scheduledTime", scheduledTime.formatted(.dateTime.month().day().hour().minute().second()))
        
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastingPlan.intermediate.fastingPeriod)      //für Testzwecke umstellen
        //endTime = scheduledTime.addingTimeInterval(FastingPlan.intermediate.fastingPeriod * 60 * 60)    //dies ist Echtzeit!!!!******************************************
    }
    
    
    func toggleFastingState() {
        fastingState = fastingState == .fasting ? .feeding : .fasting
        startTime = Date()
        elapsedTime = 0.0
    }
    
    //track, ob der CountDown fertig ist oder nicht(ExtraTime)
    func track() {
        guard fastingState != .notStarted else {return}  //fasting process hat gestartet, dann fahrefort, sonst tue nix
        print("now", Date().formatted(.dateTime.month().day().hour().minute().second()))
        if endTime >= Date() {
            print("Not elapsed")
            elapsed = false
        } else {
            print("elapsed")
            elapsed = true
        }
        
        //Prozent und Progressring mit gleicher Fortschrittsanzeige
        elapsedTime += 1
        print("elapsedTime", elapsedTime)
        
        let totalTime = fastingState == .fasting ? fastingTime : feedingTime
        progress = (elapsedTime / totalTime * 100).rounded() / 100
        print("progress", progress)
    }
}
