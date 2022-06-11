//
//  GarmentOrderingSegmentControlTests.swift
//  Lululemon AssessmentTests
//
//  Created by Amogh Joshi on 09/06/22.
//

import XCTest
@testable import Lululemon_Assessment

class GarmentOrderingSegmentControlTests: XCTestCase {
    
    var sut: GarmentOrderingSegmentControl!
    var mockedDelegate: GarmentOrderingSegmentControlDelegateMock!
    
    override func setUpWithError() throws {
        let vc = K.Storyboard.garmentStoryboard.instantiateViewController(withIdentifier: K.Identifiers.garmentViewController)
        let garmentViewController = try XCTUnwrap(vc as? GarmentViewController)
        garmentViewController.loadView()
        sut = garmentViewController.garmentOrderingSegmentControl
        mockedDelegate = GarmentOrderingSegmentControlDelegateMock()
        sut.delegate = mockedDelegate
        sut.setUpTargetAction()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockedDelegate = nil
    }
    
    func test_segment_control_returns_alphabetical_ordering() throws {
        //arrange
        sut.selectedSegmentIndex = 0
        
        //act
        sut.sendActions(for: .valueChanged)
        
        //assert
        XCTAssertTrue(mockedDelegate.orderingChangedCalledOnAlphabeticalOrder)
    }
    
    func test_segment_control_returns_creation_time_ordering() throws {
        sut.selectedSegmentIndex = 1
        sut.sendActions(for: .valueChanged)
        XCTAssertTrue(mockedDelegate.orderingChangedCalledOnCreationTimeOrder)
    }
}
