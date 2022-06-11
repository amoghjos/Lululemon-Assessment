//
//  GarmentOrderingSegmentControlDelegateMock.swift
//  Lululemon AssessmentTests
//
//  Created by Amogh Joshi on 6/10/22.
//

import Foundation
@testable import Lululemon_Assessment

//GarmentOrderingSegmentControlDelegateMock is used to test if delegate is getting called when the segment index value changes
class GarmentOrderingSegmentControlDelegateMock: GarmentOrderingSegmentControlDelegate {
    private(set) var orderingChangedCalledOnAlphabeticalOrder = false
    private(set) var orderingChangedCalledOnCreationTimeOrder = false
    
    func orderingChanged(to order: GarmentsListOrder) {
        switch order {
        case .alphabetical:
            orderingChangedCalledOnAlphabeticalOrder = true
        case .creationTime:
            orderingChangedCalledOnCreationTimeOrder = true
        }
    }
}
