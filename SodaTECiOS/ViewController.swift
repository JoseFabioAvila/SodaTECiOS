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
    @IBOutlet weak var recordarme: UISwitch!
    
    var RestCall : RestApiManager
    var user: UserData
    
    required init?(coder aDecoder: NSCoder) {
        self.RestCall = RestApiManager()
        self.user = UserData()
        super.init(coder: aDecoder)
    }
    
    //Inicializador de la vista
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //desavilitar el teclado al hacer tap en cualquier parte.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Cuando se hace tap en cualquier parte de la vista se cierra al teclado.
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func carnetUp(_ sender: AnyObject) {
        carnet.becomeFirstResponder()
    }
    
    @IBAction func pinUp(_ sender: AnyObject) {
        pin.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Validacion de los datos de los TextField para verificar que no esten vacios
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "selectMenuSegue"{
            //let controller = segue.destinationViewController as! MenuViewController
            if carnet.text == "" || pin.text == "" {
                
                //View de alerta 
                let alert = UIAlertController()
                alert.title = "Campos vacios"
                alert.message = "Debes ingresar el carnet y pin"
                
                let alertController = UIAlertController(title: "Atencion", message: "Debes llenar ambas casillas.", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
                return false
            } else {
                if carnet.text == pin.text{
                    let user2 = RestCall.getUserData(id: carnet.text!)
                    print(user2[1])
                    if user2 == [] {
                        print("holliis")
                        return false
                    }
                    
                    user = UserData(nombre: user2[1], saldo: Int(user2[2])!, id: Int(user2[0])!)
                    
                    print(user.nombre)
                    
                    return true
                }else{
                    //View de alerta
                    let alert = UIAlertController()
                    alert.title = "Datos invalidos"
                    alert.message = "Verifica tus datos"
                    
                    let alertController = UIAlertController(title: "Atencion", message: "Los datos deben coincidir con los tuyos.", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    return false

                }
            }
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! SelectMenuViewController
        destino.user = user
    }

}

