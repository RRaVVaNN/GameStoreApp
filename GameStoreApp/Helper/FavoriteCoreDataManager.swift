//
//  FavoriteCoreDataManager.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 29.09.25.
//

import UIKit

class FavoriteCoreDataManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [Favorite]()
    
    func fetchItems() {
        do {
            items = try context.fetch(Favorite.fetchRequest())
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func saveItem(email: String, title: String) {
        let item = Favorite(context: context)
        
        item.mail = email
        item.gameTitle = title
        do {
            try context.save()
        } catch  {
            print(error.localizedDescription)
        }
    }
}

