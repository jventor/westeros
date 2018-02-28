//
//  UISplitViewController+Additions.swift
//  Westeros
//
//  Created by Jaime Ventor on 26/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit
extension UISplitViewController {
    var primaryViewController: UIViewController? {
        return self.viewControllers.first
    }
    
    var secondaryViewController: UIViewController? {
        return self.viewControllers.count > 1 ? self.viewControllers[1] : nil
    }
}
