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

    func configure(game: Game) {
        gameImage.image = UIImage(named: game.basketImage)
        gameLabel.text = game.title
        priceTitle.text = game.price
    }
    
}
