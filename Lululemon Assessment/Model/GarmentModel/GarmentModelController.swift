//
//  GarmentModelController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import Foundation

class GarmentModelController {
    
    //setting storage are private to hide implementation details of the model and making APIs below to allow developer to interact with our model
    private var garments = [String]()
    
    var totalGarments: Int {
        return garments.count
    }
    
    func addGarment(_ name: String){
        garments.append(name)
    }
    
    func getGarments(by order: GarmentsListOrder) -> [String] {
        return garments.sorted {
            $0.lowercased() < $1.lowercased()
        }
    }
}
