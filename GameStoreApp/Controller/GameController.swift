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
    @IBOutlet weak var pcIcon: UIImageView!
    @IBOutlet weak var xboxIcon: UIImageView!
    @IBOutlet weak var psIcon: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var gameInfo : Game = .init(title: "", category: [], price: "", imageName: "", about: "", platforms: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        gameBackgroundImageView.image = UIImage(named: "battlefield3background")
        nameLabel.text = gameInfo.title
        infoLabel.text = gameInfo.about
        priceLabel.text = gameInfo.price
        
        pcIcon.isHidden = !gameInfo.platforms.contains(.pc)
        xboxIcon.isHidden = !gameInfo.platforms.contains(.xbox)
        psIcon.isHidden = !gameInfo.platforms.contains(.playstation)
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
