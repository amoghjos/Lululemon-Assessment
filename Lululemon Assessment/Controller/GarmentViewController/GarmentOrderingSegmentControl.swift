//
//  GarmentOrderingSegmentControl.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 09/06/22.
//

import UIKit

class GarmentOrderingSegmentControl: UISegmentedControl {
    
    weak var delegate: GarmentOrderingSegmentControlDelegate?
    
    //I kept running into issues when trying to create custom designated intializers so I'm using seperate function for target action setup for now, but in future, we should consider removing this technical debt after doing some more research
    func setUpTargetAction() {
        addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
    }
    
    @objc func segmentedValueChanged() {
        let order = GarmentsListOrder.getOrdering(from: selectedSegmentIndex)
        delegate?.orderingChanged(to: order)
    }
}

protocol GarmentOrderingSegmentControlDelegate: AnyObject {
    func orderingChanged(to order: GarmentsListOrder)
}
