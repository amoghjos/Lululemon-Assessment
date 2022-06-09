//
//  Lululemon_AssessmentTests.swift
//  Lululemon AssessmentTests
//
//  Created by Amogh Joshi on 08/06/22.
//

import XCTest
@testable import Lululemon_Assessment

class GarmentModelControllerTests: XCTestCase {
    
    var sut: GarmentModelController!
    
    override func setUpWithError() throws {
        sut = GarmentModelController()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_add_garment_increments_total_garment_count() throws {
        //arrange
        let garments = ["Jeans", "Shirts", "Pants"]
        
        //act
        for garment in garments {
            sut.addGarment(garment)
        }

        //assert
        XCTAssertEqual(sut.totalGarments, garments.count)
    }
    
    func test_get_garments_by_alphabetical_order() throws {
        let garments = ["bGarment", "zzgarment","Fgarment", "Egarment","kgarment","Agarment"]
        
        for garment in garments {
            sut.addGarment(garment)
        }
        
        let output = sut.getGarments(by: .alphabetical)
        let expected = ["Agarment","bGarment","Egarment","Fgarment","kgarment","zzgarment"]
        XCTAssertEqual(output, expected)
    }
    
    
    func test_get_garments_by_creation_time_order() throws {
        for i in 1...10 {
            
        }
    }
}
