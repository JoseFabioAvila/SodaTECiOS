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
    @IBAction func Logout(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)   }
    
    //Numero de componentes que conforma al PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Cantidad de Items del PickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    //Carga cada uno de los Items del arreglo al PickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    //Cuando se selecciona un item del PickerView se guarda en la variable menuSeleccionado, el horario de comida seleccionado
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        menuSeleccionado = pickerDataSource[row]
    }
    
    
    //envia el menu seleccionado a cargar en la vista de menu
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! MenuViewController
        destino.info = menuSeleccionado
    }

}
