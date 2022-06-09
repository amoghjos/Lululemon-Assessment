//
//  GarmentViewControllerDataSourceTests.swift
//  Lululemon AssessmentTests
//
//  Created by Amogh Joshi on 09/06/22.
//

import XCTest
@testable import Lululemon_Assessment

//The reason these tests are integration tests because GarmentViewControllerDataSource uses GarmentModelController API to build the table view so we are ensuring that units from model layers are correctly combined
class GarmentViewControllerDataSourceTests: XCTestCase {

    var sut: GarmentViewControllerDataSource!
    var mockedDelegate: GarmentViewControllerDataSourceDelegate!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        mockedDelegate = GarmentViewControllerDataSourceDelegateMock()
        sut = GarmentViewControllerDataSource(delegate: mockedDelegate)
        tableView = UITableView()
        tableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
    }

    func test_number_of_rows_initial_state() throws {
        let actualNumberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(actualNumberOfRows, 0)
    }
    
    func test_number_of_rows_after_adding_5_garments() throws {
        let expectedGarments = ["Dress","Jeans", "Shirt", "Pant","Tshirt"]

        let delegate = try XCTUnwrap(sut.delegate)
        
        for garment in expectedGarments {
            delegate.garmentModelController.addGarment(garment)
        }
        
        let actualNumberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(actualNumberOfRows, expectedGarments.count)
    }
}

class GarmentViewControllerDataSourceDelegateMock: GarmentViewControllerDataSourceDelegate {
    var garmentModelController: GarmentModelController
    
    let currentOrdering: GarmentsListOrder
    
    init(_ ordering: GarmentsListOrder = .alphabetical) {
        currentOrdering = ordering
        garmentModelController = GarmentModelController()
    }
}
