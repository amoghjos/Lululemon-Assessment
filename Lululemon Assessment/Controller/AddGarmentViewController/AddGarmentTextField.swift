//
//  AddGarmentTextField.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 10/06/22.
//

import UIKit

protocol AddGarmentTextFieldDelegate: AnyObject {
    func hasValidGarmentNameWritten(_ bool: Bool)
}

class AddGarmentTextField: UITextField {
    weak var addGarmentTextFieldDelegate: AddGarmentTextFieldDelegate?
    
    func setUp(){
        becomeFirstResponder()
        delegate = self
    }
}

extension AddGarmentTextField: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        addGarmentTextFieldDelegate?.hasValidGarmentNameWritten(true)
    }
}
