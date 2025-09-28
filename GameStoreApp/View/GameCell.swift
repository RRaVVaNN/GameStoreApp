//
//  GameCell.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 19.09.25.
//

import UIKit

class GameCell: UICollectionViewCell {
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var backGroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // backGroundImageView.backgroundColor = .clear
    }
    func configure(game: Game) {
            titleLabel.text = game.title
            priceLabel.text = game.price
            gameImageView.image = UIImage(named: game.imageName)
        }
}
