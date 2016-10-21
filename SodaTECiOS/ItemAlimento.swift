//
//  ItemAlimento.swift
//  SodaTECiOS
//
//  Created by Jose Fabio Avila Estrada on 10/7/16.
//  Copyright © 2016 Jose Fabio Avila Estrada. All rights reserved.
//

import Foundation
import UIKit

class ItemAlimento {
    var name : String
    var price : Int
    var image : UIImage //de momento en este formato
    var isCheck : Bool
    
    init(name: String, price: Int, image: String){
        self.name = name
        self.price = price
        self.image = UIImage(named: image)!
        self.isCheck = false
    }
}
