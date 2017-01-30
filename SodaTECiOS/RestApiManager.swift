//
//  RestApiManager.swift
//  SodaTECiOS
//
//  Created by Jose Fabio Avila Estrada on 12/2/16.
//  Copyright © 2016 Jose Fabio Avila Estrada. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RestApiManager {
    
    
    //trae los datos del usurio
    public func getUserData2(id: String) -> UserData {
        
        var user : UserData?
        
        user = UserData(nombre: "Jose Fabio Avila", saldo: 10000, id: 201233238)
        
        return user!
    }
    
    
    //trae los datos del usurio
    public func getUserData(id: String, user: UserData){
        
        let endpoint: String = "http://172.24.0.152/WebServiceSodaTec/Personas/Persona/2015118888"//+id
        
        //var userl = [String]()
        
        Alamofire.request(endpoint, method: .get)
            .responseJSON { response in
                //JSON
                //var user = [String]()
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on Personas/Persona/"+id)
                    print(response.result.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let object = response.result.value as? [String: Any] else {
                    print("didn't get object as JSON from API")
                    print("Error: \(response.result.error)")
                    return
                }
                
                guard let iduser = object["Id"] as? Int else {
                    print("Saldo no existe en el JSON")
                    return
                }
                
                guard let nombre = object["Nombre"] as? String else {
                    print("Nombre no existe en el JSON")
                    return
                }
                
                guard let saldo = object["Saldo"] as? Int else {
                    print("Saldo no existe en el JSON")
                    return
                }
                
                user.id = iduser
                user.nombre = nombre
                user.saldo = saldo
                
                
                //print(object, nombre, saldo, id, separator: " \n ", terminator: "\n")
                //print(user[1])
                //user = UserData(nombre: nombre, saldo: saldo, id: id2)
        }
    }
    
    //trae todos los alimentos de la comida deseada
    public func getComidas2(comida: String) -> [ItemAlimento] {
        
        var lista = [ItemAlimento]()
        
        var item = ItemAlimento(name: "Arroz", price: 100, image: "arroz")
        lista.append(item)
        item = ItemAlimento(name: "Frijoles", price: 200, image: "frijoles")
        lista.append(item)
        item = ItemAlimento(name: "Huevo duro", price: 300, image: "huevo_duro")
        lista.append(item)
        item = ItemAlimento(name: "Ensalada", price: 50, image: "ensalada")
        lista.append(item)
        item = ItemAlimento(name: "Fresco chan", price: 200, image: "fresco_chan")
        lista.append(item)
        
        return lista
    }
    
    
    //trae todos los alimentos de la comida deseada
    public func getComidas(comida: String, listaa: [ItemAlimento]) {
        
        let endpoint: String = "http://172.24.41.126:80/WebServiceSodaTec/Comidas/"+comida
        var lista = listaa
        
        //var lista = [ItemAlimento]()
        
        Alamofire.request(endpoint, method: .get)
            .responseJSON { response in
                //JSON
                
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on Comidas/"+comida)
                    print(response.result.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let object = response.result.value else {
                    print("didn't get object as JSON from API")
                    print("Error: \(response.result.error)")
                    return
                }
                
                let json = JSON(object)
                if let jArray = json.array {
                    for item in jArray {
                        let listItem : ItemAlimento
                        print("-----------")
                        //private byte[] imagen;
                        let nombre = item["nombre"].string!
                        let precio = item["precio"].int!
                        //let imagen = item["imagen"].string!
                        listItem = ItemAlimento(name: nombre, price: precio, image: "")
                        lista.append(listItem)
                        print(nombre, precio, separator: "\n", terminator: "\n")
                    }
                }
        }
    }
    
    
}
