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
    
    func test_get_garments_by_alphabetical_order() throws {
        let garments = ["bGarment", "zzgarment","Fgarment", "Egarment","kgarment","Agarment"]
        for garment in garments {
            GarmentModelController.shared.addGarment(garment)
        }
        let output = GarmentModelController.shared.getGarments(by: .alphabetical)
        let expected = ["Agarment","bGarment","Egarment","Fgarment","kgarment","zzgarment"]
        XCTAssertEqual(output, expected)
    }
}
