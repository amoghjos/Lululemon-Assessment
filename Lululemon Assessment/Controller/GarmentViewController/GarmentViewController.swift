//
//  ViewController.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import UIKit

class GarmentViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var garmentOrderingSegmentControl: GarmentOrderingSegmentControl!
    
    var garments = [String]()
    var garmentModelController = GarmentModelController()
    
    var dataSource: GarmentViewControllerDataSource!
    
    //MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGarments()
        setupTableViewDataSource()
        setUpGarmentOrderingSegmentControlDelegate()
    }
    
    private func updateGarments() {
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
    
    //MARK:- Add Garment Button
    @IBAction func addGarmentButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.Segues.goToAddGarmentViewController, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case K.Segues.goToAddGarmentViewController:
            guard let destinationVC = segue.destination as? UINavigationController else { return }
            guard let addGarmentVC = destinationVC.topViewController as? AddGarmentViewController else { return }
            addGarmentVC.delegate = self
        default:
            return
        }
    }
}

//MARK:- Protocol Confirmation
extension GarmentViewController: GarmentViewControllerDataSourceDelegate {
}

extension GarmentViewController: GarmentOrderingSegmentControlDelegate {
    func orderingChanged(to order: GarmentsListOrder) {
        garments = garmentModelController.getGarments(by: order)
        tableView.reloadData()
    }
}

extension GarmentViewController: AddGarmentViewControllerDelegate {
    func garmentAdded(with name: String) {
        garmentModelController.addGarment(name)
        updateGarments()
        tableView.reloadData()
    }
}
