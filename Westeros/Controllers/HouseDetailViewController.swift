//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 12/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var wordsLabel: UILabel!
    
    // MARK: - Properties
    let model: House
    
    // MARK: - Initialization
    init(model: House){
        // Primero, limpiar nuestro propo desorden
        self.model = model
        // Llamar a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
                title = model.name
    }
    
    // Chapuza de los de cupertino relacionada con los nil
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    /*
  override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
 */
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
    
   
    // MARK: - Sync
    func syncModelWithView(){
        // Model --> View
       houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words

    }
    
    
    // MARK: - UI
    func setupUI(){
        let wikiButton = UIBarButtonItem (title: "Wiki", style: .plain, target: self, action: #selector(displayWiki))

        let membersButton = UIBarButtonItem(title: "Members", style: .plain, target: self, action: #selector(displayMembers))
        navigationItem.rightBarButtonItems = [membersButton, wikiButton]

    }
    
    @objc func displayWiki(){
        // Creamos el WIkiVC/
        let wikiViewController = WikiViewController(model: model)
        
        //HAcemos push// MARK: -
        navigationController?.pushViewController(wikiViewController, animated: true)
    }
    
    @objc func displayMembers(){
        let membersController = MemberListViewController(model: model)
        
        navigationController?.pushViewController(membersController, animated: true)
    }

}
