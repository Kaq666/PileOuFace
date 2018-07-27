//
//  PileOuFace.swift
//  PileOuFace
//
//  Created by Quentin Billy on 04/07/2018.
//  Copyright © 2018 Quentin Billy. All rights reserved.
//

import Foundation

enum PileOuFace: Int {
    case pile = 0
    case face = 1
    
    public static var lancer: PileOuFace {
        get {
            Manager.addTour()
            let randomNumber: Int = Int(arc4random_uniform(2))
            return PileOuFace.init(rawValue: randomNumber)!
        }
    }
    
}
