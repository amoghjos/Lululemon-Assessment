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
        let mock = PersistenceStorageMock()
        sut = GarmentModelController(storage: mock)
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
        let inputGarments = ["bGarment", "zzgarment","Fgarment", "Egarment","kgarment","Agarment"]
        
        for garment in inputGarments {
            sut.addGarment(garment)
        }
        
        let output = sut.getGarments(by: .alphabetical)
        let expected = ["Agarment","bGarment","Egarment","Fgarment","kgarment","zzgarment"]
        XCTAssertEqual(output, expected)
    }
    
    
    func test_get_garments_by_creation_time_order() throws {
        var expected = [String]()
        
        let inputGarments = ["bGarment", "zzgarment","Fgarment", "Egarment","kgarment","Agarment"]
        
        for i in 0..<inputGarments.count {
            let garment = inputGarments[i]
            let garmentWithCreationIndex = "\(garment): created \(i+1)" //using index to indicate which garment was created first
            expected.append(garmentWithCreationIndex)
            sleep(1) //1 second delay to setup different creation time
            sut.addGarment(garmentWithCreationIndex)
        }
        
        let output = sut.getGarments(by: .creationTime)
        
        XCTAssertEqual(expected, output)
    }
}
