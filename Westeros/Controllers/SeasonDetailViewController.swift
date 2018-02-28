//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 24/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

// MARK: - Class: SeasonDetailController
class SeasonDetailViewController: UIViewController {
    // MARK: - OUtlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet var imgSeason: UIImageView!
    
    // MARK: - Properties
    var model : Season
    
    // MARK: - Initialization
    init (model: Season){
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = "Season"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cycle of life
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
    
    func syncModelWithView(){
        lblName.text = model.name
        lblReleaseDate.text = model.releaseDate.description
        imgSeason.image = model.image
    }
    
    // MARK: - UI
    func setupUI(){
        let episodesButton = UIBarButtonItem (title: "Episodes",
                                              style: .plain,
                                              target: self,
                                              action: #selector(displayEpisodes))
         navigationItem.rightBarButtonItem = episodesButton
    }
    
    @objc func displayEpisodes(){
        let episodeListController = EpisodeListViewController(model: model.sortedEpisodes)
        navigationController?.pushViewController(episodeListController, animated: true)
    }
}

// MARK: - Extension
extension SeasonDetailViewController: SeasonListViewControllerDelegate{
    func seasonListViewController (_ vc: SeasonListViewController, didSelectSeason season: Season) {
        self.model = season
        syncModelWithView()
    }
}


