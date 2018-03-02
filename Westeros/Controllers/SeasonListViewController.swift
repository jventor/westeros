//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 24/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

// MARK: - Protocol: SeasonListViewControllerDelegate
protocol SeasonListViewControllerDelegate: class {
    func seasonListViewController (_ vc: SeasonListViewController, didSelectSeason season: Season)
}

// MARK: - Class SeasonListViewController
class SeasonListViewController: UITableViewController {
    // MARK: - Properties
    let model: [Season]
    weak var delegate: SeasonListViewControllerDelegate?
    
    // MARK: - Inicialization
    init (model: [Season]){
        self.model = model
        super.init(style: .plain)
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle of life
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let lastRow = UserDefaults.standard.integer(forKey: Const.LastSeason)
        let indexPath = IndexPath(row: lastRow, section: 0)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Reuse o create a cell with id="Seasons"
        let cell = tableView.reusedOrNewCell(cellId: "Seasons")
        
        // Rescue model of selected row
        let season = model[indexPath.row]
        
        // Sincronize view
        cell.textLabel?.text = season.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Recuperamos el modelo
        let season = model[indexPath.row]
        
        // Avisamos al delegado
        delegate?.seasonListViewController(self, didSelectSeason: season)
        
        // Notificamos el cambio de temporada
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(Const.SeasonDidChangeNotificationName),
                                        object: self,
                                        userInfo: [Const.SeasonKey: season])
        notificationCenter.post(notification)
        
        if UI_USER_INTERFACE_IDIOM() == .phone {
            let sdvc = SeasonDetailViewController(model: season)
            splitViewController?.showDetailViewController(sdvc.wrappedInNavigation(), sender: nil)
        }
        
        // Guardar las coordenadas de la ultima casa seleccionada
        saveLastSelectedSeason(at: indexPath.row)
    }
}

// MARK: - Class extension: SeasonListViewController
extension SeasonListViewController {
    func saveLastSelectedSeason(at row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: Const.LastSeason)
        // Por si las moscas
        defaults.synchronize()
    }
    
    func lastSelectedSeason() -> Season {
        // Extraer la row del User defaults
        let row  = UserDefaults.standard.integer(forKey: Const.LastSeason)
        // Averiguar la temporada de ese row
        let season = model[row]
        // Devolverla
        return season
    }
}
