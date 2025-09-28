//
//  CoreDataManager.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 22.09.25.
//

import UIKit

class CoreDataManager {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var users = [User]()
    //var completion: (([User]) -> Void)?
    
    func fetchItems() {
        do {
            users = try context.fetch(User.fetchRequest())
            //  completion?(users)
        } catch {
            print (error.localizedDescription)
        }
    }
    
    func saveItem(name: String, email: String, password: String) {
        let user = User(context: context)
        
        user.username = name
        user.email = email
        user.password = password
        do {
            try context.save()
            fetchItems()
        } catch  {
            print(error.localizedDescription)
        }
    }
}
