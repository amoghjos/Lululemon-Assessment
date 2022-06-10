//
//  GarmentModelController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import Foundation

//Inspiration: https://www.swiftbysundell.com/articles/model-controllers-in-swift/
class GarmentModelController {
    
    var totalGarments: Int {
        return PersistenceStorage.getGarments().count
    }
    
    func addGarment(_ garmentName: String){
        PersistenceStorage.addGarment(garmentName)
    }
    
    func getGarments(by order: GarmentsListOrder = .alphabetical) -> [String] {
        let garments = PersistenceStorage.getGarments()
        return garments
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
