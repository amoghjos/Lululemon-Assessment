//
//  StorageProtocol.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 6/10/22.
//

import Foundation

//protocol used by GarmentModelController to define if any storage module wants to iniciate GarmentModelController, they need to provide an storage solution which confirms to StorageProtocol
protocol StorageProtocol {
    func addGarment(_ name: String)
    func getGarments() -> [Garment]
}
