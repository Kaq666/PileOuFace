//
//  PlayerChoiceViewController.swift
//  PileOuFace
//
//  Created by Quentin Billy on 08/07/2018.
//  Copyright © 2018 Quentin Billy. All rights reserved.
//

import UIKit

class PlayerChoiceViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var ui_tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ui_tableView.dataSource = self
        ui_tableView.backgroundColor = UIColor(named: "Ocean")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func notHome(segue: UIStoryboardSegue) {
        Manager.i().pileOuFace = PileOuFace.lancer
        print(Manager.i().pileOuFace!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Manager.i().playerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: SegmentedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "selectPileOuFace-cell", for: indexPath) as? SegmentedTableViewCell {
            cell.ui_playerNameLabel.text = Manager.i().playerList[indexPath.row].prenom + " : "
                return cell
        }
        return tableView.dequeueReusableCell(withIdentifier: "selectPileOuFace-cell", for: indexPath)
    }

}
