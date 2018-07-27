//
//  JoueurManager.swift
//  PileOuFace
//
//  Created by Quentin Billy on 08/07/2018.
//  Copyright © 2018 Quentin Billy. All rights reserved.
//

import Foundation
import UIKit

class Manager {
    private static var instance: Manager? = nil
    public static func i() -> Manager {
        if Manager.instance == nil {
            Manager.instance = Manager()
        }
        return Manager.instance!
    }
    
    public var playerList: Array<Joueur>
    public var pileOuFace: PileOuFace?
    public var numberOfCell: Int = 2
    public var tour: Int = 0
    
    init() {
        playerList = []
    }
    
    public static func countScore() {
        for joueur in Manager.i().playerList {
            if joueur.dernierChoix == Manager.i().pileOuFace {
                joueur.aGagne()
            } else {
                joueur.aPerdu()
            }
        }
    }
    
    public static func addTour() {
        Manager.i().tour = Manager.i().tour + 1
    }
    
    public static func randomGage(view: UIViewController, joueurByScore: Array<Joueur>) {
        if Int(arc4random_uniform(3)) == 0 { //33% de chance d'avoir un gage
            let alert: UIAlertController = UIAlertController(title: "Attention 🤪", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            if Int(arc4random_uniform(2)) == 0 { //1er joueur
                alert.message = "\(joueurByScore[0].prenom) distribue \(arc4random_uniform(4) + 1) gorgée(s) !"
            } else { // 2ème joueur
                alert.message = "\(joueurByScore[joueurByScore.count - 1].prenom) bois \(arc4random_uniform(5) + 1) gorgée(s)"
            }
            view.present(alert, animated: true, completion: nil)
        }
    }
}
