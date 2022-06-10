//
//  GarmentModelController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import Foundation

//Inspiration: https://www.swiftbysundell.com/articles/model-controllers-in-swift/
class GarmentModelController {
    
    //setting storage are private to hide implementation details of the model and making APIs below to allow developer to interact with GarmentModelController
    #warning("instead of having this as an array, use a computed property which access CoreData to get current garments. In case, set does not work b/c big update is required, do that work in addGarment prob")
    private var garments = [Garment]()
    
    var totalGarments: Int {
        return garments.count
    }
    
    func addGarment(_ garmentName: String){
        let garment = Garment(name: garmentName, creationTime: Date())
        garments.append(garment)
    }
    
    func getGarments(by order: GarmentsListOrder = .alphabetical) -> [String] {
        return garments
            .sorted {
                switch order {
                case .creationTime:
                    return $0.creationTime > $0.creationTime //decending order: latest garments first
                case .alphabetical:
                    return $0.name.lowercased() < $1.name.lowercased() //ascending order
                }
            }
            .map {
                $0.name
            }
    }
}
