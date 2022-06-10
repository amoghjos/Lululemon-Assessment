//
//  CoreDataModel.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 6/10/22.
//

import Foundation
import CoreData

//PersistenceStorage is implemented using CoreData and it only exposes 2 APIs to allows other models to interact with it while rest of the implementation details are kept hidden
struct PersistenceStorage {
    static func addGarment(_ name: String){
        
    }
    
    static func getGarments() -> [Garment] {
        return []
    }
}
