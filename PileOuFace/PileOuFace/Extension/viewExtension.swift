//
//  viewExtension.swift
//  PileOuFace
//
//  Created by Quentin Billy on 10/07/2018.
//  Copyright © 2018 Quentin Billy. All rights reserved.
//
import Foundation
import UIKit

extension UIView {
    func shake(duration: CFTimeInterval) {
        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x");
        translation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        translation.values = [-3, 3, -3, 3, -2, 2, -1, 1, 0]
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = [-3, 3, -3, 3, -2, 2, -1, 1, 0].map {
            ( degrees: Double) -> Double in
            let radians: Double = (.pi * degrees) / 180.0
            return radians
        }
        
        let shakeGroup: CAAnimationGroup = CAAnimationGroup()
        shakeGroup.animations = [translation, rotation]
        shakeGroup.duration = duration
        self.layer.add(shakeGroup, forKey: "shakeIt")
    }
}
