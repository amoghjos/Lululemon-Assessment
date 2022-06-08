//
//  GarmentModelController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import Foundation

class GarmentModelController {
    //I'm using a singleton design pattern to ensure there exists only one instance which contains all the garments user have created and have provided APIs below to access the storage
    static let shared = GarmentModelController()
    
    private var garments = [String]()
    
    var totalGarments: Int {
        return garments.count
    }
    
    func addGarment(_ garment: String){
        garments.append(garment)
    }
}
