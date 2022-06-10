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
    
    var garments = [String]()
    var garmentModelController = GarmentModelController()
    
    var dataSource: GarmentViewControllerDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInitialGarments()
        setupTableViewDataSource()
        setUpGarmentOrderingSegmentControlDelegate()
    }
    
    private func setUpInitialGarments() {
        let currentSegmentIndex = garmentOrderingSegmentControl.selectedSegmentIndex
        let currentOrdering = GarmentsListOrder.getOrdering(from: currentSegmentIndex)
        garments = garmentModelController.getGarments(by: currentOrdering)
    }
    
    private func setupTableViewDataSource() {
        dataSource = GarmentViewControllerDataSource(delegate: self)
        tableView.dataSource = dataSource
    }
    
    private func setUpGarmentOrderingSegmentControlDelegate() {
        garmentOrderingSegmentControl.delegate = self
        garmentOrderingSegmentControl.setUpTargetAction()
    }
}

extension GarmentViewController: GarmentViewControllerDataSourceDelegate {
}

extension GarmentViewController: GarmentOrderingSegmentControlDelegate {
    func orderingChanged(to order: GarmentsListOrder) {
        garments = garmentModelController.getGarments(by: order)
        tableView.reloadData()
    }
}
