//
//  CategoryCell.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 19.09.25.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.textColor = .lightGray
        titleLabel.font = .systemFont(ofSize: 16)
    }

    func configure(category: Category, isSelected: Bool) {
        titleLabel.text = category.displayName
        titleLabel.textColor = isSelected
        ? .systemYellow
        : .lightGray
        titleLabel.font = isSelected
        ? .boldSystemFont(ofSize: 16)
        : .systemFont(ofSize: 16)
    }
}
