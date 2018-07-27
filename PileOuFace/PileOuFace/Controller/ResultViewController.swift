//
//  ResultViewController.swift
//  PileOuFace
//
//  Created by Quentin Billy on 08/07/2018.
//  Copyright © 2018 Quentin Billy. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var ui_tableView: UITableView!
    private var joueurListByScore: Array<Joueur> = []
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ui_tableView.backgroundColor = UIColor(named: "Ocean")
        Manager.countScore()
        sortJoueurByScore()
        continueButton.isHidden = true
        newGameButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (timer) in
            Manager.randomGage(view: self, joueurByScore: self.joueurListByScore)
            self.continueButton.isHidden = false
            self.newGameButton.isHidden = false
        }
        ui_tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Manager.i().playerList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "tour-cell", for: indexPath)
        if indexPath.row == 0 {
            if let title = cell.textLabel {
                title.text = "Tour n° \(Manager.i().tour)"
            }
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "result-cell", for: indexPath)
            if let title = cell.textLabel, let subtitle = cell.detailTextLabel {
                switch indexPath.row {
                case 1:
                    title.text = "🥇 \(joueurListByScore[indexPath.row - 1].prenom)"
                case 2:
                    title.text = "🥈 \(joueurListByScore[indexPath.row - 1].prenom)"
                case 3:
                    title.text = "🥉 \(joueurListByScore[indexPath.row - 1].prenom)"
                default:
                    title.text = joueurListByScore[indexPath.row - 1].prenom
                }
                if !joueurListByScore[indexPath.row - 1].gagne {
                    title.text = title.text! + " tu bois !"
                }
                subtitle.text = "Score : \(joueurListByScore[indexPath.row - 1].score)"
            }
        }
        return cell
    }
    
    func sortJoueurByScore() {
        let taille: Int = Manager.i().playerList.count - 1
        joueurListByScore = Manager.i().playerList
        
        for i in 0...taille {
            for j in i...taille {
                if joueurListByScore[i].score < joueurListByScore[j].score {
                    joueurListByScore.swapAt(i, j)
                }
            }
        }
    }

}
