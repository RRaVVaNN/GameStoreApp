//
//  GameController.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 23.09.25.
//

import UIKit

class GameController: UIViewController {
    @IBOutlet private weak var gameBackgroundImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var pcIcon: UIImageView!
    @IBOutlet private weak var xboxIcon: UIImageView!
    @IBOutlet private weak var psIcon: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    private let cartManager = CartCoreDataManager()
    private let favoriteManager = FavoriteCoreDataManager()
    private let userManager = UserDataManager()
    //private var userFavoriteGames : [Favorite] {
   //     favoriteManager.items.filter { $0.mail == userManager.getString(key: .email) }
  //  }
    var gameInfo : Game = .init(title: "", category: [], price: "", imageName: "", pageImage: "", basketImage: "", about: "", platforms: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Game"

            navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 22)
            ]
        updateUI()
        favoriteManager.fetchItems()
        cartManager.fetchItems()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
      //  favoriteManager.fetchItems()
        if let email = userManager.getString(key: .email) {
            if favoriteManager.items.contains(where:  { $0.mail == email && $0.gameTitle == gameInfo.title }) {
                updateFavoriteButton(isAdded: true)
            } else {
                updateFavoriteButton(isAdded: false)
            }
        }
    }
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        if let email = userManager.getString(key: .email) {
            if !favoriteManager.items.contains(where:  { $0.mail == email && $0.gameTitle == gameInfo.title }) {
                favoriteManager.saveItem(email: email, game: gameInfo)
                updateFavoriteButton(isAdded: true)
            } else {
                favoriteManager.deleteItems(email: email, title: gameInfo.title)
                updateFavoriteButton(isAdded: false)
            }
        }
    }
    @IBAction func addToCartPressed(_ sender: UIButton) {
        if let email = userManager.getString(key: .email) {
            cartManager.saveItem(email: email, game: gameInfo)
        }
    }
    
    
    func updateUI(){
        gameBackgroundImageView.image = UIImage(named: gameInfo.pageImage)
        nameLabel.text = gameInfo.title
        infoLabel.text = gameInfo.about
        priceLabel.text = gameInfo.price
        
        pcIcon.isHidden = !gameInfo.platforms.contains(.pc)
        xboxIcon.isHidden = !gameInfo.platforms.contains(.xbox)
        psIcon.isHidden = !gameInfo.platforms.contains(.playstation)
        
            
    }
    
    func updateFavoriteButton(isAdded: Bool) {
        if isAdded {
            favoriteButton.setImage(UIImage(systemName: "heart.fill" ), for: .normal)
            favoriteButton.tintColor = .red
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            favoriteButton.tintColor = .systemBackground
        }

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
