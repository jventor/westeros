//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 15/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"
let HOUSE_KEY = "HouseKey"

protocol HouseListViewControllerDelegate {
    // should, will, did
    
    func houseListViewController (_ vc: HouseListViewController, didSelectHouse house: House)
}


class HouseListViewController: UITableViewController {
    
    // MARK: - Properties
    let model: [House]
    var delegate: HouseListViewControllerDelegate?
    
    // MARK: - Initialization// MARK: -
    init(model: [House]){
        self.model = model
        super.init(style: .plain)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HouseCell"
        
        // Descrubir cual es la casa que tenemos que mosyrar// MARK: -
        let house = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sicnroniza house (model) con cell (vista)
        
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
 
    // MARK: - table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar que casa han usado
        let house = model[indexPath.row]
        
 /*
        // Crear un controlador de detalle de esa casa
        let houseDetailViewController = HouseDetailViewController(model: house)
        // Hacer un push
        navigationController?.pushViewController(houseDetailViewController, animated: true)
    */
        // Avisamos al delegado
        delegate?.houseListViewController(self, didSelectHouse: house)
        
        // Mando la misma info a traves de notificaciones
        let notificationcCenter = NotificationCenter.default
        
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY: house])
        
        notificationcCenter.post(notification)
    }
}
