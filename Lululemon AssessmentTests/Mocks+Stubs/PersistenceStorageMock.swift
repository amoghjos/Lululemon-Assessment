//
//  PersistenceStorageMock.swift
//  Lululemon AssessmentTests
//
//  Created by Amogh Joshi on 6/10/22.
//

import Foundation
@testable import Lululemon_Assessment

//PersistenceStorageMock is actually a temporary storage of Garments which is to be used for testing data source and models which depends on storage of garments
class PersistenceStorageMock: StorageProtocol {
    private var garments = [Garment]()
    
    func addGarment(_ name: String) {
        let garment = Garment(name: name, creationTime: Date())
        garments.append(garment)
    }
    
    func getGarments() -> [Garment] {
        return garments
    }
}
