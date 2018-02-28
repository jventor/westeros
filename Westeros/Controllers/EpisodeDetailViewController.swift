//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 24/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    // MARK: - OUtlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblIssueDate: UILabel!
    @IBOutlet weak var lblSeason: UILabel!
    
    // MARK: - Properties
    var model : Episode
    
    // MARK: - Initialization
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episode"
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
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
    
    func syncModelWithView() {
        lblTitle.text = model.title
        lblIssueDate.text = model.issueDate.description
        lblSeason.text = model.season?.name

    }
}


