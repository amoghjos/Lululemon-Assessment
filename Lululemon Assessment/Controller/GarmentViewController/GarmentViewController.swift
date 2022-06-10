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
    
    //MARK:- View Did Load
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
    
    //MARK:- Add Garment Button
    @IBAction func addGarmentButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.Segues.goToAddGarmentViewController, sender: self)
    }
    
    #warning("this code wasn't yet needed but it is mostly needed for adding delegate which isn't ready yet so once that is done assign it here and remove this warning :)")
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case K.Segues.goToAddGarmentViewController:
            let vc = segue.destination
            guard let addGarmentViewController = vc as? AddGarmentViewController else { return }
            
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
