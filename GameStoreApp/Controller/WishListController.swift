//
//  WishListController.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 30.09.25.
//

import UIKit

class WishListController: UIViewController {
    
    @IBOutlet private weak var table: UITableView!
    private let wishListManager = FavoriteCoreDataManager()
    private let userManager = UserDataManager()
    private var wishListGames = [Favorite]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        wishListManager.fetchItems()
        table.dataSource = self
        table.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wishListManager.fetchItems()
        setUpWishListItems()
        setUpTableView()
    }
    
    func setUpTableView() {
        table.register(UINib(nibName: "gameTableCell", bundle: nil), forCellReuseIdentifier: "gameTableCell")
    }
    func setUpWishListItems() {
        if let email = userManager.getString(key: .email){
            wishListGames = wishListManager.items.filter{ $0.mail == email }
            table.reloadData()
           // wishListGames = allGames.filter { $0.title == wi }
        }
    }
}

//MARK: - CELL
extension WishListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wishListGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameTableCell") as! gameTableCell
        cell.configureFavorite(game: wishListGames[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let email = userManager.getString(key: .email),
               let title = wishListGames[indexPath.row].gameTitle {
                wishListManager.deleteItems(email: email, title: title )
                setUpWishListItems()
            }
        }
    }
}

