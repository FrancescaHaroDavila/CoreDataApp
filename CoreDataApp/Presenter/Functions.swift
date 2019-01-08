//
//  Functions.swift
//  CoreDataApp
//
//  Created by Francesca Valeria Haro Dávila on 1/8/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Functions {

  var students: [NSManagedObject] = []

  func save(name:String, age:Int16) {

    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

    let manageContext = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "Student", in: manageContext)!
    let student = NSManagedObject(entity: entity, insertInto: manageContext)
    student.setValue(name, forKey: "name")
    student.setValue(age, forKey: "age")

    do {
      try manageContext.save()
      students.append(student)
      print(students)
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
  }

  func delete(name: String){
    
  
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
  
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
    fetchRequest.predicate = NSPredicate(format: "name = %@")
    
    do
    {
      let test = try managedContext.fetch(fetchRequest)
      
      let objectToDelete = test[0] as! NSManagedObject
      managedContext.delete(objectToDelete)
      
      do{
        try managedContext.save()
      }
      catch
      {
        print(error)
      }
      
    }
    catch
    {
      print(error)
    }
  }
  
}
