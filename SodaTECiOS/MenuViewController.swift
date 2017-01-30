//
//  MenuViewController.swift
//  SodaTECiOS
//
//  Created by Jose Fabio Avila Estrada on 9/30/16.
//  Copyright © 2016 Jose Fabio Avila Estrada. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var saldoAcount: UILabel!
    
    @IBOutlet weak var nombreUser: UILabel!
    @IBOutlet weak var horarioMenu: UILabel!
    
    var RestCall : RestApiManager
    var itemList = [ItemAlimento]()
    var total : Int
    var saldo : Int
    var info: String
    var user: UserData
    
    
    //inicializa las variables necesarias para correr el View
    required init?(coder aDecoder: NSCoder) {
        
        self.RestCall = RestApiManager()
        self.itemList = [ItemAlimento] ()
        
        self.itemList = []
        
        self.total = 0
        self.saldo = 10000
        self.info = ""
        self.user = UserData()
        
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        saldo = user.saldo
        nombreUser.text = user.nombre
        saldoAcount.text = "Saldo: ₡"+String(saldo)
        totalPrice.text = "Total: ₡"+String(total)
        horarioMenu.text = info
        
        itemList = RestCall.getComidas(comida: info)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Boton de salir del menu
    @IBAction func salir(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    //Define la cantidad de celdas del TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    //Carga los datos a cada una de las celdas del TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! CustomCell
        cell.photo.image = UIImage(named: "sorry-image-not-available")
        cell.name.text = itemList[indexPath.row].name
        cell.price.text = "₡"+String(itemList[indexPath.row].price)
        
        configureCheckmarkForCel(cell, item: itemList[indexPath.row])
        
        return cell
    }
    
    //Cuando se selecciona una celda del TableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath)
        {
            let item = itemList[indexPath.row]
            item.isCheck = !item.isCheck
            configureCheckmarkForCel(cell, item: item)
            putInMyDish(cell, item: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true )
    }
    
    
    //Cambia el Checkmark de true a false, o de false a true, cuando el usuario pulsa el la celda del alimento escogido
    func configureCheckmarkForCel(_ cell: UITableViewCell, item: ItemAlimento){
        if item.isCheck{
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
    }
    
    //Coloca el alimento en en la bandeja y aumenta o decrementa el precio en el total y saldo, segun si esta con el checkmark o no.
    func putInMyDish(_ cell: UITableViewCell,item: ItemAlimento){
        if item.isCheck{
            saldo = saldo - item.price
            total = total + item.price
        }
        else {
            saldo = saldo + item.price
            total = total - item.price
        }
        saldoAcount.text = "Saldo: ₡"+String(saldo)
        totalPrice.text = "Total: ₡"+String(total)
    }
    
    
}
