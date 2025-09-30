//
//  gameTableCell.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 30.09.25.
//

import UIKit

class gameTableCell: UITableViewCell {
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var priceTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureFavorite(game: Favorite) {
        gameImage.image = UIImage(named: game.gameImage ?? "")
        gameLabel.text = game.gameTitle
        priceTitle.text = game.gamePrice
    }
    func configureCart(game: Cart) {
        gameImage.image = UIImage(named: game.gameImage ?? "")
        gameLabel.text = game.gameTitle
        priceTitle.text = game.gamePrice
    }
    
}
