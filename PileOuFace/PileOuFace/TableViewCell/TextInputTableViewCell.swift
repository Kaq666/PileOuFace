//
//  TextInputTableViewCell.swift
//  PileOuFace
//
//  Created by Quentin Billy on 05/07/2018.
//  Copyright © 2018 Quentin Billy. All rights reserved.
//

import UIKit

public class TextInputTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var ui_textField: UITextField!
    
    public func configure(value: String, placeHolder: String) {
        ui_textField.textColor = UIColor.white
        ui_textField.text = value
        ui_textField.placeholder = placeHolder
        ui_textField.delegate = self
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
