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
    private var allGames = [Game]()
    private var wishListGames = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "WishList"

        wishListManager.fetchItems()
        table.dataSource = self
        table.delegate = self
        setUpTableView()
        
    }
    
    func setUpTableView() {
        table.register(UINib(nibName: "gameTableCell", bundle: nil), forCellReuseIdentifier: "gameTableCell")
    }
    func setUpWishListItems() {
        if let email = userManager.getString(key: .email){
            var wishListGameNames : String {  }
           // wishListGames = allGames.filter { $0.title == wi }
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

//MARK: - CELL
extension WishListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wishListManager.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameTableCell") as! gameTableCell
        cell.configure(game: <#T##Game#>)
        return cell
    }
    
}
//MARK: - JSon
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
