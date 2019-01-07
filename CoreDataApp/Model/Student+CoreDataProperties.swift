//
//  Student+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by Francesca Valeria Haro Dávila on 1/7/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?

}
