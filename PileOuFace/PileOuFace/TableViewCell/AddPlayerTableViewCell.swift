//
//  AddPlayerTableViewCell.swift
//  PileOuFace
//
//  Created by Quentin Billy on 09/07/2018.
//  Copyright © 2018 Quentin Billy. All rights reserved.
//

import UIKit

class AddPlayerTableViewCell: UITableViewCell {
    
    @IBAction func addPlayerTouched() {
        Manager.i().numberOfCell = Manager.i().numberOfCell + 1
        if let ui_tableView: UITableView = superview as? UITableView {
            ui_tableView.insertRows(at: [IndexPath(row: Manager.i().numberOfCell - 1, section: 0)], with: .left)
        } else {
            print("ERROR")
        }
    }
}
