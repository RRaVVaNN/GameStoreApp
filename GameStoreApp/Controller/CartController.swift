//
//  CartController.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 30.09.25.
//

import UIKit

class CartController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    
    private let cartManager = CartCoreDataManager()
    private let userManager = UserDataManager()
    private var cartGames = [Cart]()
    private var totalPrice : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cart"

            navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 22)
            ]
        
        cartManager.fetchItems()
        table.dataSource = self
        table.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartManager.fetchItems()
        setUpWishListItems()
        setUpTableView()
    }
    
    func setUpTableView() {
        table.register(UINib(nibName: "gameTableCell", bundle: nil), forCellReuseIdentifier: "gameTableCell")
    }
    func setUpWishListItems() {
        totalPrice = 0
        if let email = userManager.getString(key: .email){
            cartGames = cartManager.items.filter{ $0.mail == email }
            for game in cartGames {
                totalPrice += Double(game.gamePrice ?? "0") ?? 0
            }
            priceLabel.text = String(totalPrice)
            table.reloadData()
        }
    }

}

//MARK: - CELL
extension CartController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartGames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameTableCell") as! gameTableCell
        cell.configureCart(game: cartGames[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
