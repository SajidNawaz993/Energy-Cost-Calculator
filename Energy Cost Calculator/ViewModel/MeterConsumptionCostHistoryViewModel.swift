//
//  MeterConsumptionCostHistoryViewModel.swift
//  Energy Cost Calculator
//
//  Created by Sajid Nawaz on 03/08/2022.
//

import Foundation
import CoreData
import UIKit



public class MeterConsumptionCostHistoryViewModel {
    
    func createonsumptionCostHistoryData(_ serviceNumber:Int64,_ currentMeterReading:Int64, _ cost:Int64){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        //Now let’s create an entity and new slab records.
        let meterConsumptionCostHistory = NSEntityDescription.insertNewObject(forEntityName: "MeterConsumptionCostHistory", into: managedContext) as? MeterConsumptionCostHistory
        meterConsumptionCostHistory?.serviceNumber = serviceNumber
        meterConsumptionCostHistory?.currentMeterReading = currentMeterReading
        meterConsumptionCostHistory?.cost = cost
        //Now we have set all the values. The next step is to save them inside the Core Data
        do {
            try managedContext.save()
           
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
