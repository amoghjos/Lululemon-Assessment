//
//  GarmentData+CoreDataProperties.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 6/10/22.
//
//

import Foundation
import CoreData


extension GarmentData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GarmentData> {
        return NSFetchRequest<GarmentData>(entityName: "GarmentData")
    }

    @NSManaged public var name: String
    @NSManaged public var creationTime: Date

}

extension GarmentData : Identifiable {

}
