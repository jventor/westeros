//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 18/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

// MARK: - Class: MemberListViewController
class MemberListViewController: UITableViewController {
    // MARK: - Properties
    var model : House
   
    // MARK: - Inicialization
    init(model: House){
        self.model = model
        super.init(style: .plain)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle of life
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(houseDidChange(notification:)),
                                       name: NSNotification.Name(rawValue: Const.HouseDidChangeNotificationName),
                                       object: nil)
    }
    
    @objc func houseDidChange(notification: Notification){
        if let userInfo = notification.userInfo {
            model = userInfo[Const.HouseKey] as! House
            title = "Members"
            self.tableView.reloadData()
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
        // Preguntar por una celda (a una cache) o Crearla
        let cell = tableView.reusedOrNewCell(cellId: "MemberCell")
        
        // Descrubir cual es la persona que tenemos que mostrar
        let member = model.sortedMembers[indexPath.row]
        
        // Sicnroniza house (model) con cell (vista)
        cell.textLabel?.text = member.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = model.sortedMembers[indexPath.row]
        let memberDetailViewController = MemberDetailViewController(model: member)
        navigationController?.pushViewController(memberDetailViewController, animated: true)
    }
}
