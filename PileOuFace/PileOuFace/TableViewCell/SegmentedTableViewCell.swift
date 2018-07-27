//
//  SegmentedTableViewCell.swift
//  PileOuFace
//
//  Created by Quentin Billy on 08/07/2018.
//  Copyright © 2018 Quentin Billy. All rights reserved.
//

import UIKit

class SegmentedTableViewCell: UITableViewCell {
    @IBOutlet weak var ui_playerNameLabel: UILabel!
    @IBOutlet weak var ui_playerChoiceSegmented: UISegmentedControl!
    
    @IBAction func choiceChanged() {
        if let id: Int = getJoueurId() {
            let joueur: Joueur = Manager.i().playerList[id]
            joueur.dernierChoix = PileOuFace(rawValue: ui_playerChoiceSegmented.selectedSegmentIndex)
        }
    }
    
    func getJoueurId() -> Int? {
        var num: Int = 0
        for joueur in Manager.i().playerList {
            if String(joueur.prenom + " : ") == ui_playerNameLabel.text {
                return num
            }
            num = num + 1
        }
        return nil
    }
    
}
