//
//  AddGarmentViewController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 10/06/22.
//

import UIKit

class AddGarmentViewController: UIViewController {
    @IBOutlet weak var garmentNameTextField: AddGarmentTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
