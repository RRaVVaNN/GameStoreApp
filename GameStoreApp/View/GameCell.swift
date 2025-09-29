//
//  GameCell.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 19.09.25.
//

import UIKit

class GameCell: UICollectionViewCell {
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var backGroundImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    private let backgrounds = ["pinkBackground","greenBackground","cyanBackground","redBackground","yellowBackground","blueBackground"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // backGroundImageView.backgroundColor = .clear
    }
    func configure(game: Game, num: Int) {
        let backgroundNum = (num - (num/6)*6)
        backGroundImageView.image = UIImage(named: backgrounds[backgroundNum])
        titleLabel.text = game.title
        priceLabel.text = game.price
        gameImageView.image = UIImage(named: game.imageName)
    }
}
