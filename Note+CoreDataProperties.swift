//
//  Note+CoreDataProperties.swift
//  
//
//  Created by Apple on 21/10/2022.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var content: String?
    @NSManaged public var createdDate: Date?
    @NSManaged public var id: Int64
    @NSManaged public var image: String?
    @NSManaged public var label: String?

}
