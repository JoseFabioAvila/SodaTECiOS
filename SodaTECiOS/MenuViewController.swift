//
//  MenuViewController.swift
//  SodaTECiOS
//
//  Created by Jose Fabio Avila Estrada on 9/22/16.
//  Copyright © 2016 Jose Fabio Avila Estrada. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UITableViewController { //, UITableViewDelegate {
    
    var names = [String]()
    
    override func viewDidLoad() {
        names = ["hola 1","hola 2","hola 3","hola 4"]
    }
    
    /*override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        <#code#>
    }*/
}
