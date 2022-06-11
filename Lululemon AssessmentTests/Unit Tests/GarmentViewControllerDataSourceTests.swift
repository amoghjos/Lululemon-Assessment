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
    var sutDelegate: GarmentViewControllerDataSourceDelegate!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.Identifiers.garmentTableViewCell)
        tableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
        sutDelegate = nil
    }
    
    private let inputGarments = K.SampleData.garments
    
    private func setUpDataSource(with garments: [String]) {
        sutDelegate = GarmentViewControllerDataSourceDelegateStub(garments)
        sut = GarmentViewControllerDataSource(delegate: sutDelegate)
    }
    
    private func testingNumberOfRows(with garments: [String]) {
        setUpDataSource(with: garments)
        let actualNumberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(actualNumberOfRows, garments.count)
    }
    
    func test_number_of_rows_for_no_garments() throws {
        testingNumberOfRows(with: [])
    }
    
    func test_number_of_rows_after_adding_input_garments() throws {
        testingNumberOfRows(with: inputGarments)
    }
    
    func test_cell_for_rows_after_adding_input_garments() throws {
        setUpDataSource(with: inputGarments)
        for i in 0..<inputGarments.count {
            let indexPath = IndexPath(item: i, section: 0)
            let cell = sut.tableView(tableView, cellForRowAt: indexPath)
            let textLabel = try XCTUnwrap(cell.textLabel)
            
            let garment = inputGarments[i]
            XCTAssertEqual(textLabel.text,garment)
        }
    }
}
