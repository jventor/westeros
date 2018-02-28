//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 25/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {
    // MARK: - OUtlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblHouse: UILabel!
    @IBOutlet weak var lblAlias: UILabel!
    
    // MARK: - Properties
    var model : Person
    
    // MARK: - Initialization
    init (model: Person){
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = "Member"
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
        navigationController?.popViewController(animated: true)
    }
    
    func syncModelWithView(){
        lblName.text = model.name
        lblHouse.text = model.house?.name
        lblAlias.text = model.alias
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
}

