//
//  HomeController.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 16.09.25.
//

import UIKit

class HomeController: BaseViewController, UITextFieldDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    
    private var allGames: [Game] = []
    private var searchedGames: [Game] = []
    private var showedGames: [Game] = []
    private var currentCategory: Category = .all
    private var filteredGames: [Game] {
        if currentCategory != .all {
            allGames.filter { $0.category.contains(currentCategory) }
        } else {
            allGames
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTitle(title: "Search")
        
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        setupCollectionView()
        //setupSampleData()
        getGameData()
        searchedGames = allGames
        // Do any additional setup after loading the view.
    }

    @objc func textFieldDidChange() {
        let text = searchTextField.text ?? ""
        if text.isEmpty {
            searchedGames = filteredGames
            collectionView.reloadData()
        } else {
            searchedGames = filteredGames.filter { $0.title.lowercased().contains(text.lowercased())}
            collectionView.reloadData()
        }
    }
    private func getGameData() {
        guard let fileURL = Bundle.main.url(forResource: "Game", withExtension: "json") else { return }
        print(fileURL)
        
        guard let data = try? Data(contentsOf: fileURL) else { return }

        do {
            allGames = try JSONDecoder().decode([Game].self,
                                                    from: data)
            collectionView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    private func setupCollectionView() {
        let gameNib = UINib(nibName: "GameCell", bundle: nil)
        collectionView.register(gameNib, forCellWithReuseIdentifier: "GameCell")
        
        let headerNib = UINib(nibName: "CategoriesHeaderView", bundle: nil)
        collectionView.register(
            headerNib,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "CategoriesHeaderView"
        )
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.headerReferenceSize = CGSize(width: collectionView.frame.width, height: 60)
        }
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}


// MARK: - Cells

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchedGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.configure(game: searchedGames[indexPath.item], num: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "CategoriesHeaderView",
            for: indexPath
        ) as! CategoriesHeaderView
        header.onSelectCategory = { category in
            self.currentCategory = category
            self.collectionView.reloadData()
            self.textFieldDidChange()
        }
        header.setSelectedCategory(category: currentCategory)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 24) / 2
        return CGSize(width: width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "GameController") as! GameController
        controller.gameInfo = searchedGames[indexPath.item]
        navigationController?.show(controller, sender: nil)
    }
}
