//
//  GarmentModelController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import Foundation

//setting fileprivate because Garment is used only within GarmentModelController
fileprivate struct Garment {
    let name: String
    let creationTime: Date
}

class GarmentModelController {
    
    //setting storage are private to hide implementation details of the model and making APIs below to allow developer to interact with GarmentModelController
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
