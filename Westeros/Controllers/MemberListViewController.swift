//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 18/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

class MemberListViewController: UITableViewController {
    
    let model : House
    
    init(model: House){
        self.model = model
        super.init(style: .plain)
        title = "Members of \(model.name) House"
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
        
        let cellId = "MemberCell"
        
        // Descrubir cual es la casa que tenemos que mosyrar// MARK: -
        let member = model.sortedMembers[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sicnroniza house (model) con cell (vista)
        
        cell?.textLabel?.text = member.name
        
        return cell!
    }

}
