//
//  GarmentViewControllerDataSourceDelegateStub.swift
//  Lululemon AssessmentTests
//
//  Created by Amogh Joshi on 6/10/22.
//

import Foundation
@testable import Lululemon_Assessment

//GarmentViewControllerDataSourceDelegateStub is just used to pass in input garments for the data source
class GarmentViewControllerDataSourceDelegateStub: GarmentViewControllerDataSourceDelegate {
    var garments: [String]
    
    init(_ garments: [String]) {
        self.garments = garments
    }
}
