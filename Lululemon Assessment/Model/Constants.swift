//
//  Constants.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import UIKit

enum K {
    static var garmentStoryboard: UIStoryboard {
        let bundle = Bundle(identifier: "com.craftedthoughts.Lululemon-Assessment")
        let storyboard = UIStoryboard(name: "Garment", bundle: bundle)
        return storyboard
    }
    
    enum Identifiers {
        static let garmentTableViewCell = "GarmentTableViewCell"
        static let garmentViewController = "GarmentViewController"
    }
    
    enum Segues {
        static let goToAddGarmentViewController = "GoToAddGarmentViewController"
    }
    
    enum SampleData {
        static let garments = ["Jeans", "Shirt", "Pant","Tshirt","Dress"]
        static let garmentsSortedAlphabetically = ["Dress","Jeans","Pant", "Shirt","Tshirt"]
    }
}
