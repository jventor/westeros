//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 18/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

class MemberListViewController: UITableViewController {

    var model : House
    
    init(model: House){
        self.model = model
        super.init(style: .plain)
        title = "Members of \(model.name) House"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange(notification:)), name: NSNotification.Name(rawValue: HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    
    @objc func houseDidChange(notification: Notification){
        if let userInfo = notification.userInfo {
            model = userInfo[HOUSE_KEY] as! House
            self.tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
        
        let cellId = "MemberCell"
        
        // Descrubir cual es la persona que tenemos que mostrar
        let member = model.sortedMembers[indexPath.row]
        
        // Preguntar por una celda (a una cache) o Crearla
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        // Sicnroniza house (model) con cell (vista)
        
        cell.textLabel?.text = member.name
        
        return cell
    }
 
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
