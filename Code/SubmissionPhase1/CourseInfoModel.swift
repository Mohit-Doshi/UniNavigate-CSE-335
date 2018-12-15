//
//  CourseInfoModel.swift
//  SubmissionPhase1
//
//  Created by Mohit on 18/11/18.
//  Copyright © 2018 Mohit D. All rights reserved.
// This will handle all the objects for all the courses, adding/modifying/deleting

import UIKit
import CoreData
import Foundation

public class CourseInfoModel
{
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        var fetchResults = [CourseInfo]()
    
        init()
        {
            // default constructor defaulting
        }
    
        func numberofrecords() -> Int
        {
                // Creating a new fetch request using the CourseInfo
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CourseInfo")
                var x = 0
                // Executing the fetch request, and casting the results to an array of CourseInfo objects
                fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [CourseInfo])!
            
                print(fetchResults)
            
                x = fetchResults.count
            
                print("Number of entities: \(x)\n")
            
                // return how many entities are present in the coreData
                return x
        }
    
        func stringofrecords() -> String
        {
            var ret:String = ""
            // Creating a new fetch request using the CourseInfo
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CourseInfo")
            // Executing the fetch request, and casting the results to an array of CourseInfo objects
            fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [CourseInfo])!
            for i in 0..<fetchResults.count
            {
                ret.append("\(fetchResults[i].courseName!) \n")
            }
            
            return ret
        }
    
    func addCourseInfo(cID:String, cName:String, cNotes:[String], picture1: Data, picture2: Data, picture3: Data)
        {    // adds a courseInfo object to Core Data
            // creating a new entity object
            let ent = NSEntityDescription.entity(forEntityName: "CourseInfo", in: self.managedObjectContext)
            //adding to the managed object context
            let newItem = CourseInfo(entity: ent!, insertInto: self.managedObjectContext)
            newItem.identification = cID
            newItem.courseName = cName
            if var t:[String] = cNotes
            {
                newItem.notes = cNotes
            }
            if var t:NSData = picture1 as NSData
            {
                newItem.image1 = picture1 as NSData
            }
            if var t:NSData = picture2 as NSData
            {
                newItem.image2 = picture2 as NSData
            }
            if var t:NSData = picture3 as NSData
            {
                newItem.image3 = picture3 as NSData
            }
            
            // saving the updated context
            do {
                try self.managedObjectContext.save()
            } catch _ {
            }
            
            print(newItem)
        }
    
    
    func doesCourseInfoExist(eyeDee:String) -> Bool // if object is there -> true, else -> false
    {
        // Creating a new fetch request using the CourseInfo
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CourseInfo")
        // Executing the fetch request, and casting the results to an array of CourseInfo objects
        fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [CourseInfo])!
        
        for i in 0..<fetchResults.count
        {
            if fetchResults[i].identification == eyeDee
            {
                return true
            }
        }
        return false
    }
    
    func getCourseInfoObject(eyeDee:String) -> CourseInfo // returns the course information as a CourseInfo object
        {
            // Creating a new fetch request using the CourseInfo
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CourseInfo")
            // Executing the fetch request, and casting the results to an array of CourseInfo objects
            fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [CourseInfo])!
            
            for i in 0..<fetchResults.count
            {
                if fetchResults[i].identification == eyeDee
                {
                    return fetchResults[i]
                }
            }
            return fetchResults[fetchResults.count] // this will fail
        }
    
    func updateCourseInfo(cID:String, cName:String, cNotes:[String], picture1: Data, picture2: Data, picture3: Data)
    {
        
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CourseInfo")
           // fetchRequest.predicate = NSPredicate(format: "jobId = '-1'")
            fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [CourseInfo])!

            for object in fetchResults
            {
               if(object.identification == cID)
               {
                    //newItem.identification = cID
                   // newItem.courseName = cName
                    if var t:[String] = cNotes
                    {
                        object.notes = cNotes
                    }
                    if var t:NSData = picture1 as NSData
                    {
                        object.image1 = picture1 as NSData
                    }
                    if var t:NSData = picture2 as NSData
                    {
                        object.image2 = picture2 as NSData
                    }
                    if var t:NSData = picture3 as NSData
                    {
                        object.image3 = picture3 as NSData
                    }
                }
            }
            // saving the updated context
            do {
                try managedObjectContext.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
       /* do {
            try self.managedObjectContext.save()
        } catch _ {
        }*/
    } // we're done updating
    
} // end of class
