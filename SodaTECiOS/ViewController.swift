//
//  ViewController.swift
//  SodaTECiOS
//
//  Created by Jose Fabio Avila Estrada on 9/22/16.
//  Copyright © 2016 Jose Fabio Avila Estrada. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    //TextFields de carnet y pin
    @IBOutlet weak var carnet: UITextField!
    @IBOutlet weak var pin: UITextField!
    
    //Inicializador de la vista
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //desavilitar el teclado al hacer tap en cualquier parte.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Cuando se hace tap en cualquier parte de la vista se cierra al teclado.
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func carnetUp(sender: AnyObject) {
        carnet.becomeFirstResponder()
    }
    
    @IBAction func pinUp(sender: AnyObject) {
        pin.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Validacion de los datos de los TextField para verificar que no esten vacios
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "selectMenuSegue"{
            //let controller = segue.destinationViewController as! MenuViewController
            if carnet.text == "" || pin.text == "" {
                
                //View de alerta 
                let alert = UIAlertController()
                alert.title = "Campos vacios"
                alert.message = "Debes ingresar el carnet y pin"
                
                let alertController = UIAlertController(title: "Atencion", message: "Debes llenar ambas casillas.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                return false
            }
            return true
        }
        return false
    }

}

