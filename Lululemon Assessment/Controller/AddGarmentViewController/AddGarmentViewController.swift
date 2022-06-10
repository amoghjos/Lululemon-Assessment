//
//  AddGarmentViewController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 10/06/22.
//

import UIKit

protocol AddGarmentViewControllerDelegate: AnyObject {
    func garmentAdded(with name: String)
}

class AddGarmentViewController: UIViewController {
    @IBOutlet weak var garmentNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    weak var delegate: AddGarmentViewControllerDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        garmentNameTextField.becomeFirstResponder()
    }
    
    @IBAction func garmentNameTextFieldEditingChanged(_ sender: UITextField) {
        let currentText = garmentNameTextField.text
        saveButton.isEnabled = AddGarmentLogicController.shouldEnableSaveButton(currentText)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        guard let garmentName = garmentNameTextField.text else { return }
        delegate?.garmentAdded(with: garmentName)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
