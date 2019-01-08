//
//  ViewController.swift
//  CoreDataApp
//
//  Created by Francesca Valeria Haro Dávila on 1/4/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit
import CoreData

class StudentViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  let StudentCellIdentifier = "StudentCell"
  var functionInstance = Functions()
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
    
    do {
      functionInstance.students = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
  }
  
  @IBAction func btnAdd(_ sender: UIBarButtonItem) {
    
    let alert = UIAlertController(title: "Student List", message: "Add a new student", preferredStyle: UIAlertController.Style.alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .default) { (alertAction) in
      
      let textField = alert.textFields![0] as UITextField
      let nameToSave = textField.text ?? ""
      
      let textField2 = alert.textFields![1] as UITextField
      let ageToSave = Int16(textField2.text ?? "0") ?? 0
      
      self.functionInstance.save(name: nameToSave, age: ageToSave)
      self.tableView.reloadData()
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    
    alert.addTextField { (textField) in textField.placeholder = "Name"}
    alert.addTextField { (textField2) in textField2.placeholder = "Age"}
    alert.addAction(cancelAction)
    alert.addAction(saveAction)

    present(alert, animated: true)
  }
}

extension StudentViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return functionInstance.students.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let student = functionInstance.students[indexPath.row]
    guard let cell = tableView.dequeueReusableCell(withIdentifier: self.StudentCellIdentifier, for: indexPath) as? StudentCell else {
      return UITableViewCell()
    }
    cell.txtName.text = student.value(forKey: "name") as? String
    cell.txtAge.text = String(student.value(forKey: "age") as? Int ?? 0)
    return cell
  }
 }
