//
//  MeterInfoViewModel.swift
//  Energy Cost Calculator
//
//  Created by Sajid Nawaz on 03/08/2022.
//

import Foundation
import CoreData
import UIKit


public class MeterInfoViewModel {
    
    func createMeterInfoData(_ serviceNumber:Int64,_ currentMeterReading:Int64){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        //Now let’s create an entity and new slab records.
        let meterInfo = NSEntityDescription.insertNewObject(forEntityName: "MeterInfo", into: managedContext) as? MeterInfo
        meterInfo?.serviceNumber = serviceNumber
        meterInfo?.currentMeterReading = currentMeterReading
        meterInfo?.isRecordInConsumption = false
        
        //Now we have set all the values. The next step is to save them inside the Core Data
        do {
            try managedContext.save()
           
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func retrieveMeterInfoData(_ serviceNumber:Int64)-> [MeterInfo] {
           //As we know that container is set up in the AppDelegates so we need to refer that container.
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
           //We need to create a context from this container
           let managedContext = appDelegate.persistentContainer.viewContext
           //Prepare the request of type NSFetchRequest  for the entity
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MeterInfo")
           fetchRequest.predicate = NSPredicate(format: "serviceNumber = %d", serviceNumber)
           do {
               let result = try managedContext.fetch(fetchRequest)
               return result as! [MeterInfo]
           } catch {
               return []
           }
       }
    
    func updateMeterInfoData(_ serviceNumber:Int64){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return  }
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MeterInfo")
        fetchRequest.predicate = NSPredicate(format: "serviceNumber = %d", serviceNumber)
        do
        {
            let result = try managedContext.fetch(fetchRequest)
            for meter in result as! [MeterInfo] {
                meter.isRecordInConsumption = true
            }
            do{
                try managedContext.save()
            }
            catch
            {
                print(error)
            }
         }
        catch
        {
            print(error)
        }
       
    }
    
}
