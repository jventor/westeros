//
//  UITableView+Additions.swift
//  Westeros
//
//  Created by Jaime Ventor on 24/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit

extension UITableView{
    func reusedOrNewCell (cellId: String) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
    }
}
