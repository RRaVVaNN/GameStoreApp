//
//  Favorite+CoreDataProperties.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 30.09.25.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var gameTitle: String?
    @NSManaged public var mail: String?
    @NSManaged public var gameImage: String?
    @NSManaged public var gamePrice: String?

}

extension Favorite : Identifiable {

}
