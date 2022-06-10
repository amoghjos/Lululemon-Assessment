//
//  Garment+CoreDataProperties.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 6/10/22.
//
//

import Foundation
import CoreData


extension Garment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Garment> {
        return NSFetchRequest<Garment>(entityName: "Garment")
    }

    @NSManaged public var name: String?
    @NSManaged public var creationTime: Date?

}

extension Garment : Identifiable {

}
