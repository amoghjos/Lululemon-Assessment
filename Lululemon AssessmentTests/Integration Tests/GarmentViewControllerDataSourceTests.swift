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
        mockedDelegate = GarmentViewControllerDataSourceDelegateMock(K.SampleData.garments)
        sut = GarmentViewControllerDataSource(delegate: mockedDelegate)
        let vc = try XCTUnwrap(K.storyboard.instantiateViewController(withIdentifier: K.Identifiers.garmentViewController) as? GarmentViewController)
        
        vc.loadView()
        tableView = vc.tableView
        tableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
        mockedDelegate = nil
    }
   
    func test_number_of_rows_after_adding_few_garments() throws {
        let actualNumberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(actualNumberOfRows, 5)
    }
    
    func test_cell_for_rows_after_adding_few_garments() throws {


    
        for i in 0..<K.SampleData.garments.count {
            let garment = K.SampleData.garments[i]
            let indexPath = IndexPath(item: i, section: 0)
            let cell = sut.tableView(tableView, cellForRowAt: indexPath)
            let textLabel = try XCTUnwrap(cell.textLabel)
            XCTAssertEqual(textLabel.text,garment)
        }
    }
}

class GarmentViewControllerDataSourceDelegateMock: GarmentViewControllerDataSourceDelegate {
    var garments: [String]
    
    init(_ garments: [String]) {
        self.garments = garments
    }
}
