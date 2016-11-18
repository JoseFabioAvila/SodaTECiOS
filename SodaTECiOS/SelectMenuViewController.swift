//
//  SelectMenuViewController.swift
//  SodaTECiOS
//
//  Created by Jose Fabio Avila Estrada on 10/20/16.
//  Copyright © 2016 Jose Fabio Avila Estrada. All rights reserved.
//

import UIKit

class SelectMenuViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
    
    var pickerDataSource = ["Desayuno", "Almuerzo", "Cena"]
    var menuSeleccionado = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Logout
    @IBAction func Logout(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)   }
    
    //Numero de componentes que conforma al PickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Cantidad de Items del PickerView
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    //Carga cada uno de los Items del arreglo al PickerView
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    //Cuando se selecciona un item del PickerView se guarda en la variable menuSeleccionado, el horario de comida seleccionado
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        menuSeleccionado = pickerDataSource[row]
    }
    
    /*/deside que consulta hacer al webservice para cada horario de comida
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "menuSegue"{
            if menuSeleccionado == "Desayuno"{
                //mandar a cargar los platos del desayuno
            }
            else if menuSeleccionado == "Almuerzo"{
                //mandar a cargar los platos del almuerzo
            }
            else{
                //mandar a cargar los platos de la cena
            }
            return true
        }
        return false
    }*/
    
    //envia el menu seleccionado a cargar en la vista de menu
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destino = segue.destinationViewController as! MenuViewController
        destino.info = menuSeleccionado
    }

}
