//
//  DailyTaskViewModel.swift
//  motivation
//
//  Created by Bernadette Werneke on 24.07.23.
//

import Foundation
import CoreData

//TaskViewModel (Tasks/day)
class DailyTaskViewModel: ObservableObject {
    
    let dayContainer: NSPersistentContainer
    
    //gespeicherte Tage in Liste sammeln
    @Published var savedDays: [Day] = [Day]()
    
    init() {
        dayContainer = NSPersistentContainer(name: "DailyTasks")
        dayContainer.loadPersistentStores { description, error in
            
            if let error = error {
                fatalError("DEBUG: Core Data store loading failed: \(error.localizedDescription)")
            }
        }
        
    }
    
   
    
    
}
