//
//  Cart+CoreDataProperties.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 30.09.25.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var gameImage: String?
    @NSManaged public var gamePrice: String?
    @NSManaged public var gameTitle: String?
    @NSManaged public var mail: String?

}

extension Cart : Identifiable {

}
