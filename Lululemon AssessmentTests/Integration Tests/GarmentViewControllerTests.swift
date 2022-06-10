//
//  GarmentViewControllerTests.swift
//  Lululemon AssessmentTests
//
//  Created by Amogh Joshi on 09/06/22.
//

import XCTest
@testable import Lululemon_Assessment

// GarmentViewControllerTests are integration tests because GarmentViewController combines various units like GarmentModelController, DataSource, and Segment Control to function together as a whole
class GarmentViewControllerTests: XCTestCase {
    
    var sut: GarmentViewController!
    var tableView: UITableView!
    var segmentControl: UISegmentedControl!
    var garmentModelController: GarmentModelController!
    
    override func setUpWithError() throws {
        let vc = K.storyboard.instantiateViewController(withIdentifier: K.Identifiers.garmentViewController)
        let garmentViewController = try XCTUnwrap(vc as? GarmentViewController)
        garmentViewController.loadViewIfNeeded()
        
        sut = garmentViewController
        tableView = garmentViewController.tableView
        segmentControl = garmentViewController.garmentOrderingSegmentControl
        garmentModelController = garmentViewController.garmentModelController
    }
    
    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
        segmentControl = nil
        garmentModelController = nil
    }
    
    func test_initial_state_of_garment_view_controller() throws {
        XCTAssertEqual(tableView.numberOfRows(inSection: 0),0)
    }
    
    private func testingGarmentsViewControllerWithSomeData(segmentIndex: Int, expectedGarments: [String]) throws {
        //act
        segmentControl.selectedSegmentIndex = segmentIndex
        segmentControl.sendActions(for: .valueChanged)
        
        //assert
        for i in 0..<expectedGarments.count {
            let indexPath = IndexPath(row: i, section: 0)
            let cell = try XCTUnwrap(tableView.cellForRow(at: indexPath))
            let expectedGarment = expectedGarments[i]
            let textLabel = try XCTUnwrap(cell.textLabel)
            let actualGarment = textLabel.text
            XCTAssertEqual(expectedGarment, actualGarment)
        }
    }
    func test_garment_view_controller_alphabetical_order_segment() throws {
        //arrange
        let inputGarments = K.SampleData.garments
        for garment in inputGarments {
            garmentModelController.addGarment(garment)
        }
        
        //index 0 represent alphabetical segment
        try testingGarmentsViewControllerWithSomeData(segmentIndex: 0, expectedGarments: K.SampleData.garmentsSortedAlphabetically)
    }
    
    func test_garment_view_controller_creation_time_order_segment() throws {
        //arrange
        let inputGarments = K.SampleData.garments
        for garment in inputGarments {
            garmentModelController.addGarment(garment)
            sleep(1)
        }
        
        //index 1 represent creation time segment
        try testingGarmentsViewControllerWithSomeData(segmentIndex: 1, expectedGarments: K.SampleData.garments)
    }
}
