//
//  ViewController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import UIKit

class GarmentViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var garmentOrderingSegmentControl: GarmentOrderingSegmentControl!
    
    var garments = K.SampleData.garments
    
    var dataSource: GarmentViewControllerDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup table view data source
        dataSource = GarmentViewControllerDataSource(delegate: self)
        tableView.dataSource = dataSource
        
        //setup garment ordering segment control delegate
        garmentOrderingSegmentControl.delegate = self
        garmentOrderingSegmentControl.setUpTargetAction()
        #warning("missing: loading the data from model initially to fill garments AND segment view controller setup")
    }
}

extension GarmentViewController: GarmentViewControllerDataSourceDelegate {
}

extension GarmentViewController: GarmentOrderingSegmentControlDelegate {
    func orderingChanged(to order: GarmentsListOrder) {
        print(order)
    }
}
