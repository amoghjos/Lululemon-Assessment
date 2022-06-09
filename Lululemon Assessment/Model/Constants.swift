//
//  Constants.swift
//  Lululemon Assessment
//
//  Created by Amogh Joshi on 08/06/22.
//

import UIKit

enum K {
    
    static var storyboard: UIStoryboard {
        let bundle = Bundle(identifier: "com.craftedthoughts.Lululemon-Assessment")
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        return storyboard
    }
    
    enum Identifiers {
        static let garmentTableViewCell = "GarmentTableViewCell"
        static let garmentViewController = "GarmentViewController"
    }
    
    enum SampleData {
        static let garments = ["Dress","Jeans", "Shirt", "Pant","Tshirt"]
    }
}
