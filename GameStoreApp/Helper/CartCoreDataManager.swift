//
//  CartCoreDataManager.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 30.09.25.
//

import UIKit

class CartCoreDataManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [Cart]()
    
    func fetchItems() {
        do {
            items = try context.fetch(Cart.fetchRequest())
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func saveItem(email: String, game: Game) {
        let item = Cart(context: context)
        
        item.mail = email
        item.gameTitle = game.title
        item.gameImage = game.basketImage
        item.gamePrice = game.price
        
        do {
            try context.save()
            fetchItems()
            print("item saved")
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func deleteItems(email: String, title: String) {
        let item = items.first{ $0.mail == email && $0.gameTitle == title }
        context.delete(item!)
        print("item deleted")
        do {
            try context.save()
            print("deleted item saved")
            fetchItems()
        } catch {
            print(error.localizedDescription)
        }
    }
}

