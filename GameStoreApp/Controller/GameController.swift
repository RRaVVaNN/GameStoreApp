//
//  GameController.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 23.09.25.
//

import UIKit

class GameController: UIViewController {
    @IBOutlet weak var gameBackgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var gameInfo : Game = .init(title: "", category: [], price: "", imageName: "", about: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        gameBackgroundImageView.image = UIImage(named: "battlefield3background")
        nameLabel.text = gameInfo.title
        infoLabel.text = gameInfo.about
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
