//
//  CategoriesHeaderView.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 19.09.25.
//

import UIKit

class CategoriesHeaderView: UICollectionReusableView {
    
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var onSelectCategory: ((Category) -> Void)?
    private var categories = Category.allCases
    private var selectedIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoriesCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        categoriesCollectionView.backgroundColor = .clear
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
    }
    
    func setSelectedCategory(category: Category) {
        if let index = categories.firstIndex(of: category) {
            selectedIndex = index
            categoriesCollectionView.reloadData()
            categoriesCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}
extension CategoriesHeaderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.configure(category: categories[indexPath.item], isSelected: indexPath.item == selectedIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        collectionView.reloadData()
        onSelectCategory?(categories[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = categories[indexPath.item].displayName
        let width = (text as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize: 16)]).width
        return .init(width: width + 24, height: collectionView.bounds.height)
    }
}
