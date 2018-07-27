//
//  Joueur.swift
//  PileOuFace
//
//  Created by Quentin Billy on 04/07/2018.
//  Copyright © 2018 Quentin Billy. All rights reserved.
//

import Foundation

class Joueur {
    private static var id: Int = 0
    public static func setId() -> Int {
        Joueur.id = Joueur.id + 1
        return Joueur.id
    }
    
    private let _id: Int
    private let _prenom: String
    private var _score: Int = 0
    private var _dernierChoix: PileOuFace? = nil
    private var _gagne: Bool = false
    
    public var id: Int {
        return _id
    }
    
    public var prenom: String {
        return _prenom
    }
    
    public var score: Int {
        get {
          return _score
        }
        set {
            _score = newValue
        }
    }
    
    public var gagne: Bool {
        get {
            return _gagne
        }
        set {
            _gagne = newValue
        }
    }
    
    public var dernierChoix: PileOuFace? {
        get {
            return _dernierChoix
        }
        set {
            _dernierChoix = newValue
        }
    }
    
    init(prenom: String) {
        self._id = Joueur.setId()
        self._prenom = prenom
        self._dernierChoix = PileOuFace.pile
    }
    
    func aPerdu() {
        _score = _score - 5
        _gagne = false
    }
    
    func aGagne() {
        _score = _score + 10
        _gagne = true
    }
    
    
}
