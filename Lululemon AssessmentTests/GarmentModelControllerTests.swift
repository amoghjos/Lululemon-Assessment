//
//  Lululemon_AssessmentTests.swift
//  Lululemon AssessmentTests
//
//  Created by Amogh Joshi on 08/06/22.
//

import XCTest
@testable import Lululemon_Assessment

class GarmentModelControllerTests: XCTestCase {
    
    func test_add_garment_increments_total_garment_count() throws {
        //arrange
        let garments = ["Jeans", "Shirts", "Pants"]
        
        //act
        for garment in garments {
            GarmentModelController.shared.addGarment(garment)
        }

        //assert
        XCTAssertEqual(GarmentModelController.shared.totalGarments, garments.count)
    }
    
    #warning("test get garment by alpha and creation time")
}
