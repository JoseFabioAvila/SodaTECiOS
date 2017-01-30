//
//  UserData.swift
//  SodaTECiOS
//
//  Created by Jose Fabio Avila Estrada on 12/2/16.
//  Copyright © 2016 Jose Fabio Avila Estrada. All rights reserved.
//

import Foundation

class UserData {
    
    var nombre : String
    var saldo : Int
    var id : Int
    
    init(nombre: String, saldo: Int, id: Int){
        self.nombre = nombre
        self.saldo = saldo
        self.id = id
    }
    
    init() {
        self.nombre = ""
        self.saldo = 0
        self.id = 0
    }
}
