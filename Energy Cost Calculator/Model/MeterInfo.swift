//
//  MeterInfo.swift
//  Energy Cost Calculator
//
//  Created by Sajid Nawaz on 03/08/2022.
//
//

import Foundation
import CoreData


public class MeterInfo: NSManagedObject {
    @NSManaged public var serviceNumber: Int64
    @NSManaged public var currentMeterReading: Int64
    @NSManaged public var isRecordInConsumption: Bool
}
