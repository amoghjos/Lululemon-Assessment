//
//  GarmentViewControllerDataSource.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 09/06/22.
//

import UIKit

protocol GarmentViewControllerDataSourceDelegate: AnyObject {
    var garments: [String] { get }
}

class GarmentViewControllerDataSource: NSObject, UITableViewDataSource {
    
    weak var delegate: GarmentViewControllerDataSourceDelegate?
    
    init(delegate: GarmentViewControllerDataSourceDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.garments.count ?? 0
    }
    
    //generally, I implement seperate class for UITableViewCell and perform its setup in specific file but since it's single label cell, I'm doing it here
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.garmentTableViewCell) else {
            fatalError("Unable to create cell for first screen. Please ensure that you are using correct identifer to create UITableViewCell and cell exists in the table view.")
        }
        
        guard let textLabel = cell.textLabel else {
            fatalError("Unable to find text label in first screen UITableViewCell. Please ensure that you are using correct cell style in storyboard.")
        }
        
        textLabel.text = delegate?.garments[indexPath.row]
        
        return cell
    }
}
