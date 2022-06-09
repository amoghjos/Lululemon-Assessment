//
//  GarmentViewControllerDataSourceTests.swift
//  Lululemon AssessmentTests
//
//  Created by Amogh Joshi on 09/06/22.
//

import XCTest
@testable import Lululemon_Assessment

class GarmentViewControllerDataSourceTests: XCTestCase {

    var sut: GarmentViewControllerDataSource!
    var subDelegate: GarmentViewControllerDataSourceDelegate!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        let vc = try XCTUnwrap(K.storyboard.instantiateViewController(withIdentifier: K.Identifiers.garmentViewController) as? GarmentViewController)
        vc.loadView()
        tableView = vc.tableView
        tableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
        subDelegate = nil
    }
    
    func test_number_of_rows_for_no_garments() throws {
        subDelegate = GarmentViewControllerDataSourceDelegateStub([])
        sut = GarmentViewControllerDataSource(delegate: subDelegate)
        let actualNumberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(actualNumberOfRows, 0)
    }
    
    func test_number_of_rows_after_adding_few_garments() throws {
        subDelegate = GarmentViewControllerDataSourceDelegateStub(K.SampleData.garments)
        sut = GarmentViewControllerDataSource(delegate: subDelegate)
        let actualNumberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(actualNumberOfRows, K.SampleData.garments.count)
    }
    
    func test_cell_for_rows_after_adding_few_garments() throws {
        subDelegate = GarmentViewControllerDataSourceDelegateStub(K.SampleData.garments)
        sut = GarmentViewControllerDataSource(delegate: subDelegate)
        for i in 0..<K.SampleData.garments.count {
            let garment = K.SampleData.garments[i]
            let indexPath = IndexPath(item: i, section: 0)
            let cell = sut.tableView(tableView, cellForRowAt: indexPath)
            let textLabel = try XCTUnwrap(cell.textLabel)
            XCTAssertEqual(textLabel.text,garment)
        }
    }
}

class GarmentViewControllerDataSourceDelegateStub: GarmentViewControllerDataSourceDelegate {
    var garments: [String]
    
    init(_ garments: [String]) {
        self.garments = garments
    }
}
