//
//  GarmentModelController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import Foundation

//Inspiration: https://www.swiftbysundell.com/articles/model-controllers-in-swift/
class GarmentModelController {
    
    let persistenceStorage: PersistenceStorage
    
    //used dependency injection below to get modularity and easy mocking testing
    init(persistenceStorage: PersistenceStorage = PersistenceStorage()){
        self.persistenceStorage = persistenceStorage
    }
    
    var totalGarments: Int {
        return persistenceStorage.getGarments().count
    }
    
    func addGarment(_ garmentName: String){
        persistenceStorage.addGarment(garmentName)
    }
    
    func getGarments(by order: GarmentsListOrder = .alphabetical) -> [String] {
        let garments = persistenceStorage.getGarments()
        return garments
            .filter({
                $0.name != nil && $0.creationTime != nil
            })
            .sorted {
                switch order {
                case .creationTime:
                    return $0.creationTime! > $0.creationTime! //decending order: latest garments first
                case .alphabetical:
                    return $0.name!.lowercased() < $1.name!.lowercased() //ascending order
                }
            }
            .map {
                $0.name!
            }
    }
}
