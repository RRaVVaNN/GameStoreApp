 //
//  Favorite+CoreDataProperties.swift
//  GameStoreApp
//
//  Created by Ravan Asgarov on 26.09.25.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var mail: String?
    @NSManaged public var gameTitle: String?

}

extension Favorite : Identifiable {

}
