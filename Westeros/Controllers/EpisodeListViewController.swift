//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 24/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

protocol EpisodeListViewControllerDelegate: class {
    func episodeListViewController (_ vc: EpisodeListViewController, didSelectEpisode episode: Episode)
}

class EpisodeListViewController: UITableViewController {
    
    // MARK: - Properties
    var model : [Episode]
    weak var delegate: EpisodeListViewControllerDelegate?
    
    // MARK: - Initialization
    init (model: [Episode]){
        self.model = model
        super.init(style: .plain)
        title = "Episodes List"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle of life
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(seasonDidChange),
                                       name: NSNotification.Name(rawValue: Const.SeasonDidChangeNotificationName),
                                       object: nil)
    }
    
    @objc func seasonDidChange(notification: Notification){
        if let userInfo = notification.userInfo {
            model = (userInfo[Const.SeasonKey] as! Season).sortedEpisodes
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
        
        let cell = tableView.reusedOrNewCell(cellId: "EpisodeCell")
        
        cell.textLabel?.text = model[indexPath.row].title

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        let episodeDetailViewController = EpisodeDetailViewController(model: episode)
        navigationController?.pushViewController(episodeDetailViewController, animated: true)
        
    }

}
