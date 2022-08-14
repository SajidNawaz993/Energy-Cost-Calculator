//
//  Slab.swift
//  Energy Cost Calculator
//
//  Created by Sajid Nawaz on 03/08/2022.
//
//

import Foundation
import CoreData


public class Slab: NSManagedObject {

    @NSManaged public var slabName: String?
    @NSManaged public var slabMinRange: Int64
    @NSManaged public var slabMaxRange: Int64
    @NSManaged public var slabUnitPrice: Int64
}

