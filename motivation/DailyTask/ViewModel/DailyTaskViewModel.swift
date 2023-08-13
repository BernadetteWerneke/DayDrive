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
    
    @Published var savedDays: [Day] = [Day]()   //gespeicherte Tage in Liste sammeln
    @Published var saveCurrentDay: Day = Day()
   
    
    init() {
        dayContainer = NSPersistentContainer(name: "DailyTasks")
        dayContainer.loadPersistentStores { _, error in
            
            if let error = error {
                fatalError("DEBUG: Core Data store loading failed: \(error.localizedDescription)")
            }
        }

        
        createNewDay()
        fetchCurrentDay()
        
        dayContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy //***
    }
    
    
    func fetchDays() {
        let request = NSFetchRequest<Day>(entityName: String(describing: Day.self))
        
        do{
            savedDays = try dayContainer.viewContext.fetch(request)
        } catch {
            print("DEBUG: error fetching days: \(error.localizedDescription)")
        }
    }
    
    
    func fetchCurrentDay() {
        //Datumscheck mit Zeit als Range
        let dateFrom = Calendar.current.startOfDay(for: Date())     //StartIntervall
        var components = DateComponents()
        components.day = 1
        let dateTo = Calendar.current.date(byAdding: components, to: dateFrom)      //StopIntervall
        
        let request = NSFetchRequest<Day>(entityName: String(describing: Day.self))
        let datePredicate = NSPredicate(format: "(%@ <= todayDate) AND (todayDate < %@)", dateFrom as NSDate, dateTo! as NSDate)
        request.predicate = datePredicate
        
        do{
            let result = try dayContainer.viewContext.fetch(request)
            if let day = result.first {
                saveCurrentDay = day
            }
        } catch {
            print("DEBUG: error fetching days: \(error.localizedDescription)")
        }
    }
    

    
    //neuen Tag erstellen (bei Datumswechsel)
    func createNewDay() {
        let newDay = Day(context: dayContainer.viewContext)
        newDay.id = UUID()
        newDay.dailyWater = 0
        newDay.dailySteps = 0
        newDay.fastingTime = 0
        newDay.todayDate = Date()
        
        do {
            //allle Tage holen aus CD
            fetchDays()
            try savedDays.forEach{ day in
                if day.id == newDay.id {
                    fetchCurrentDay()
                } else {
                    try dayContainer.viewContext.save()
                    fetchCurrentDay()
                }
            }
            
        } catch {
            print("DEBUG: Create Day failed: \(error.localizedDescription)")
        }
    }
    
    
    func saveDailyWater(water: Float) {
        fetchCurrentDay()   //
        
        //dailyWater aktualisiert
        saveCurrentDay.dailyWater = round(water * 10) / 10.0
        
        print("rounded totalWaterValue: \(saveCurrentDay.dailyWater)")
        
        do {
            try dayContainer.viewContext.save()
            print("Data saved!!")
        } catch {
            print("DEBUG: dailyWater could not save: \(error.localizedDescription)")
        }
        
    }
    
    
    func saveDailyFastingTime(fastingTime: Double) {
        fetchCurrentDay()   //
        
        //fatingTime aktualisiert
        saveCurrentDay.fastingTime = fastingTime
        
        print("123CD total fasting time: \(saveCurrentDay.fastingTime)")
        
        do {
            try dayContainer.viewContext.save()
            print("Data saved!!")
        } catch {
            print("DEBUG: dailyFastingTime could not save: \(error.localizedDescription)")
        }
    }
    
    
    func saveDailySteps(steps: Int) {
        fetchCurrentDay()   //
        
        //fatingTime aktualisiert
        saveCurrentDay.dailySteps = Int64(Int(steps))
        
        print("123CD daily steps: \(saveCurrentDay.dailySteps)")
        
        
            do {
                
                try dayContainer.viewContext.save()
                print("Data saved!!")
            } catch {
                print("DEBUG: dailySteps could not save: \(error.localizedDescription)")
            }
        }
    
    
        
}
    
    
