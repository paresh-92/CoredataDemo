//
//  DemoList+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Paresh Thakkar on 22/07/21.
//
//

import Foundation
import CoreData


extension DemoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DemoList> {
        return NSFetchRequest<DemoList>(entityName: "DemoList")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: String?

}

extension DemoList : Identifiable {

}
