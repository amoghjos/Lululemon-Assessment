//
//  Constants.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import UIKit

enum K {
    enum Storyboard {
        private static let bundle = Bundle(identifier: "com.craftedthoughts.Lululemon-Assessment")
        
        static var garmentStoryboard: UIStoryboard {
            let storyboard = UIStoryboard(name: "Garment", bundle: K.Storyboard.bundle)
            return storyboard
        }
        
        static var addGarmentStoryboard: UIStoryboard {
            let storyboard = UIStoryboard(name: "AddGarment", bundle: K.Storyboard.bundle)
            return storyboard
        }
    }
    
    enum Identifiers {
        static let garmentTableViewCell = "GarmentTableViewCell"
        static let garmentViewController = "GarmentViewController"
        static let addGarmentViewController = "AddGarmentViewController"
    }
    
    enum Segues {
        static let goToAddGarmentViewController = "GoToAddGarmentViewController"
    }
    
    enum SampleData {
        static let garments = ["Jeans", "Shirt", "Pant","Tshirt","Dress"]
        static let garmentsSortedAlphabetically = ["Dress","Jeans","Pant", "Shirt","Tshirt"]
    }
    
    enum DataModel {
        static let garmentDataModel = "GarmentDataModel"
    }
}
