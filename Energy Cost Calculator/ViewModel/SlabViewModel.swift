//
//  SlabViewModel.swift
//  Energy Cost Calculator
//
//  Created by Sajid Nawaz on 03/08/2022.
//

import Foundation
import CoreData
import UIKit


public class SlabViewModel {

    func createSlabData(){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        //Now let’s create an entity and new slab records.
        let slab1 = NSEntityDescription.insertNewObject(forEntityName: "Slab", into: managedContext) as? Slab
        slab1?.slabName = "Slab1"
        slab1?.slabMinRange = 0
        slab1?.slabMaxRange = 100
        slab1?.slabUnitPrice = 5
        
        let slab2 = NSEntityDescription.insertNewObject(forEntityName: "Slab", into: managedContext) as? Slab
        slab2?.slabName = "Slab2"
        slab2?.slabMinRange = 101
        slab2?.slabMaxRange = 500
        slab2?.slabUnitPrice = 8
        
        let slab3 = NSEntityDescription.insertNewObject(forEntityName: "Slab", into: managedContext) as? Slab
        slab3?.slabName = "Slab3"
        slab3?.slabMinRange = 501
        slab2?.slabMaxRange = 0
        slab3?.slabUnitPrice = 10
        //Now we have set all the values. The next step is to save them inside the Core Data
        do {
            try managedContext.save()
           
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func retrieveSlabData()-> [Slab] {
           //As we know that container is set up in the AppDelegates so we need to refer that container.
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
           //We need to create a context from this container
           let managedContext = appDelegate.persistentContainer.viewContext
           //Prepare the request of type NSFetchRequest  for the entity
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Slab")
           do {
               let result = try managedContext.fetch(fetchRequest)
               return result as! [Slab]
           } catch {
               return []
           }
       }
}
