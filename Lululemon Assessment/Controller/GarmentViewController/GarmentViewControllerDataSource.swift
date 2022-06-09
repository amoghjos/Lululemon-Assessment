//
//  GarmentViewControllerDataSource.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 09/06/22.
//

import UIKit

protocol GarmentViewControllerDataSourceDelegate: AnyObject {
    var currentOrdering: GarmentsListOrder { get }
    var garmentModelController: GarmentModelController { get }
}

class GarmentViewControllerDataSource: NSObject, UITableViewDataSource {
    
    weak var delegate: GarmentViewControllerDataSourceDelegate?
    
    init(delegate: GarmentViewControllerDataSourceDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.garmentModelController.totalGarments ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
