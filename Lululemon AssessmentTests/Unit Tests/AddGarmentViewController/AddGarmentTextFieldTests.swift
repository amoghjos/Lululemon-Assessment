//
//  AddGarmentTextFieldTests.swift
//  Lululemon AssessmentTests
//
//  Created by Amogh Joshi on 10/06/22.
//

import XCTest
@testable import Lululemon_Assessment

class AddGarmentTextFieldTests: XCTestCase {

    var sut: AddGarmentTextField!
    
    override func setUpWithError() throws {
        
        let vc = K.Storyboard.addGarmentStoryboard.instantiateViewController(identifier: K.Identifiers.addGarmentViewController)
        let addGarmentViewController = try XCTUnwrap(vc as? AddGarmentViewController)
        addGarmentViewController.loadView()
        sut = addGarmentViewController.garmentNameTextField
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func test_text_field_has_keyboard_focus() throws {
        XCTAssertTrue(sut.isFirstResponder)
    }
}
