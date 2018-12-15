//
//  CourseInfo+CoreDataProperties.swift
//  SubmissionPhase1
//
//  Created by Mohit on 18/11/18.
//  Copyright © 2018 Mohit D. All rights reserved.
//
//

import Foundation
import CoreData


extension CourseInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CourseInfo> {
        return NSFetchRequest<CourseInfo>(entityName: "CourseInfo")
    }

    @NSManaged public var courseName: String?
    @NSManaged public var notes: [String]?
    @NSManaged public var image1: NSData?
    @NSManaged public var image2: NSData?
    @NSManaged public var image3: NSData?
    @NSManaged public var identification: String?

}
