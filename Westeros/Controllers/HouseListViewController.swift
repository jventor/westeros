//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 15/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

// MARK: - Protocol: HouseListViewControllerDelegate
protocol HouseListViewControllerDelegate: class {
    func houseListViewController (_ vc: HouseListViewController, didSelectHouse house: House)
}

// MARK: - Class: HouseListViewController
class HouseListViewController: UITableViewController {
    // MARK: - Properties
    let model: [House]
    weak var delegate: HouseListViewControllerDelegate?
    
    // MARK: - Initialization
    init(model: [House]){
        self.model = model
        super.init(style: .plain)
        title = "Houses"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle of life
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UIDevice.current.userInterfaceIdiom == .pad {
            let lastRow = UserDefaults.standard.integer(forKey: Const.LastHouse)
            let indexPath = IndexPath(row: lastRow, section: 0)
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Crear una celda
        let cell = tableView.reusedOrNewCell(cellId: "HouseCell")
        
        // Descrubir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]

        // Sicnroniza house (model) con cell (vista)
        cell.imageView?.image = house.sigil.image
        cell.textLabel?.text = house.name
        
        return cell
    }
 
    // MARK: - table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar que casa han usado
        let house = model[indexPath.row]
        
        // Avisamos al delegado
        delegate?.houseListViewController(self, didSelectHouse: house)
        
        // Mando la misma info a traves de notificaciones
        let notificationcCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(Const.HouseDidChangeNotificationName),
                                        object: self,
                                        userInfo: [Const.HouseKey: house])
        notificationcCenter.post(notification)
        
        // Guardar las coordenadas de la ultima casa seleccionada
        saveLastSelectedHouse(at: indexPath.row)
    }
}

// MARK: - Class extension: HouseListViewController
extension HouseListViewController {
    func saveLastSelectedHouse(at row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: Const.LastHouse)
        // Por si las moscas
        defaults.synchronize()
    }
    
    func lastSelectedHouse() -> House {
        // Extraer la row del User defaults
        let row  = UserDefaults.standard.integer(forKey: Const.LastHouse)
        // Averiguar la casa de ese row
        let house = model[row]
        // Devolverla
        return house
    }
}

extension HouseListViewController: HouseListViewControllerDelegate{
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House) {
        let hdvc = HouseDetailViewController(model: house)
        navigationController?.pushViewController(hdvc, animated: true)
    }
}






