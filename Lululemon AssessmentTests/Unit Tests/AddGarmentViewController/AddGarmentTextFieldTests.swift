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
    var addGarmentViewController: AddGarmentViewController!
    var addGarmentTextFieldDelegateMock: AddGarmentTextFieldDelegateMock!
    
    override func setUpWithError() throws {
        let vc = K.Storyboard.addGarmentStoryboard.instantiateViewController(identifier: K.Identifiers.addGarmentViewController)
        addGarmentViewController = try XCTUnwrap(vc as? AddGarmentViewController)
        addGarmentViewController.loadView()
        sut = addGarmentViewController.garmentNameTextField
        addGarmentTextFieldDelegateMock = AddGarmentTextFieldDelegateMock()
        sut.addGarmentTextFieldDelegate = addGarmentTextFieldDelegateMock
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_text_field_has_keyboard_focus() throws {
        XCTAssertTrue(sut.isFirstResponder)
    }
    
    func test_text_field_save_button_for_non_empty_input() throws {
        sut.text = "Some Text"
        sut.sendActions(for: .editingDidEnd)
        XCTAssertTrue(addGarmentTextFieldDelegateMock.ishasValidGarmentNameWrittenCalled)
    }
}

class AddGarmentTextFieldDelegateMock: AddGarmentTextFieldDelegate{
    var ishasValidGarmentNameWrittenCalled = false
    var booleanValueReceived: Bool?
    
    func hasValidGarmentNameWritten(_ bool: Bool) {
        ishasValidGarmentNameWrittenCalled = true
        booleanValueReceived = bool
    }
}
