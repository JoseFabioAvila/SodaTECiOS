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
    
    var itemList = [ItemAlimento]()
    var item1 : ItemAlimento
    var total : Int
    var saldo : Int
    
    //inicializa las variables necesarias para correr el View
    required init?(coder aDecoder: NSCoder) {
        
        itemList = [ItemAlimento] ()
        item1 = ItemAlimento(name: "Arroz", price: 100, image: "arroz")
        itemList.append(item1)
        item1 = ItemAlimento(name: "Frijoles", price: 200, image: "frijoles")
        itemList.append(item1)
        item1 = ItemAlimento(name: "Huevo duro", price: 300, image: "huevo_duro")
        itemList.append(item1)
        item1 = ItemAlimento(name: "Ensalada", price: 50, image: "ensalada")
        itemList.append(item1)
        item1 = ItemAlimento(name: "Fresco chan", price: 200, image: "fresco_chan")
        itemList.append(item1)
        
        total = 0
        saldo = 10000
        
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        saldoAcount.text = "Saldo: $"+String(saldo)
        totalPrice.text = "Total: $"+String(total)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Boton de salir del menu
    @IBAction func salir(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Define la cantidad de celdas del TableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    //Carga los datos a cada una de las celdas del TableView
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath) as! CustomCell
        
        cell.photo.image = itemList[indexPath.row].image
        cell.name.text = itemList[indexPath.row].name
        cell.price.text = "$"+String(itemList[indexPath.row].price)
        
        configureCheckmarkForCel(cell, item: itemList[indexPath.row])
        
        return cell
    }
    
    //Cuando se selecciona una celda del TableView
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath)
        {
            let item = itemList[indexPath.row]
            item.isCheck = !item.isCheck
            configureCheckmarkForCel(cell, item: item)
            putInMyDish(cell, item: item)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true )
    }
    
    
    //Cambia el Checkmark de true a false, o de false a true, cuando el usuario pulsa el la celda del alimento escogido
    func configureCheckmarkForCel(cell: UITableViewCell, item: ItemAlimento){
        if item.isCheck{
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
    }
    
    //Coloca el alimento en en la bandeja y aumenta o decrementa el precio en el total y saldo, segun si esta con el checkmark o no.
    func putInMyDish(cell: UITableViewCell,item: ItemAlimento){
        if item.isCheck{
            saldo = saldo - item.price
            total = total + item.price
        }
        else {
            saldo = saldo + item.price
            total = total - item.price
        }
        saldoAcount.text = "Saldo: $"+String(saldo)
        totalPrice.text = "Total: $"+String(total)
    }
    
    
    
    
    
    
    
}