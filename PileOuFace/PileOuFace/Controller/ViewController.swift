//
//  ViewController.swift
//  PileOuFace
//
//  Created by Quentin Billy on 04/07/2018.
//  Copyright © 2018 Quentin Billy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var ui_tableView: UITableView!
    @IBOutlet weak var ui_titleButton: UIButton!
    
    @IBOutlet weak var ui_view: UIView!
    
    @IBAction func home(segue: UIStoryboardSegue) {
        //Return to home
        Manager.i().playerList = []
        Manager.i().tour = 0
        ui_tableView.reloadData()
    }
    
    @IBAction func titleButtonTouched() {
        ui_view.shake(duration: 1.5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ui_tableView.backgroundColor = UIColor(named: "Ocean")
        ui_tableView.dataSource = self
        ui_tableView.delegate = self
        ui_titleButton.transform = CGAffineTransform(rotationAngle: -0.075)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Manager.i().numberOfCell + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < Manager.i().numberOfCell {
            if let cell: TextInputTableViewCell = tableView.dequeueReusableCell(withIdentifier: "customPlayer-cell", for: indexPath) as? TextInputTableViewCell {
                cell.configure(value: "", placeHolder: "Joueur \(indexPath.row + 1)")
                return cell
            }
        }
        
        return tableView.dequeueReusableCell(withIdentifier: "addPlayer-cell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let selectedRow: UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedRow.contentView.backgroundColor = UIColor(named: "Ocean")
        selectedRow.backgroundColor = UIColor(named: "Ocean")
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedRow: UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedRow.contentView.backgroundColor = UIColor(named: "Ocean")
        selectedRow.backgroundColor = UIColor(named: "Ocean")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play-segue" {
            for num in 0...Manager.i().numberOfCell {
                if let cell: TextInputTableViewCell = ui_tableView.cellForRow(at: IndexPath(row: num, section: 0)) as? TextInputTableViewCell, let name = cell.ui_textField.text {
                    if name.count > 0 {
                        Manager.i().playerList.append(Joueur(prenom: name))
                    }
                }
            }
            if Manager.i().playerList.count < 1 {
                let alert: UIAlertController = UIAlertController(title: "Oups ! 😰", message: "Impossible de commencer le jeu sans joueur.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Je vais ajouter un joueur", style: .destructive, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                Manager.i().pileOuFace = PileOuFace.lancer
                print(Manager.i().pileOuFace!)
            }
        }
    }

}

