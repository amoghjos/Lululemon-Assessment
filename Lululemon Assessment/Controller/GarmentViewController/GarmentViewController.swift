//
//  ViewController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import UIKit

class GarmentViewController: UIViewController {
    var garments = K.SampleData.garments
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: GarmentViewControllerDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup data source
        dataSource = GarmentViewControllerDataSource(delegate: self)
        tableView.dataSource = dataSource
    }
}

extension GarmentViewController: GarmentViewControllerDataSourceDelegate {
    
}
