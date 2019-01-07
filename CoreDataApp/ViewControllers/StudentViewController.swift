//
//  ViewController.swift
//  CoreDataApp
//
//  Created by Francesca Valeria Haro Dávila on 1/4/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {

  
  @IBOutlet weak var tableView: UITableView!
  
  @IBAction func btnAdd(_ sender: UIBarButtonItem) {
    
    let alert = UIAlertController(title: "Student List", message: "Add a new student", preferredStyle: UIAlertController.Style.alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .default) { (alertAction) in
      let textField = alert.textFields![0] as UITextField
      let textField2 = alert.textFields![1] as UITextField    }
    
    alert.addTextField { (textField) in
      textField.placeholder = "Name"
    }
    
    alert.addTextField { (textField2) in
      textField2.placeholder = "Age"
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    
    alert.addAction(cancelAction)
    alert.addAction(saveAction)
    present(alert, animated: true)
    
//
//      let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
//      ac.addTextField()
//
//      let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
//        let answer = ac.textFields![0]
//        let answer2 = ac.textFields![1]
//
//        // do something interesting with "answer" here
//      }
//
//      ac.addAction(submitAction)
//
//      present(ac, animated: true)
//
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }


}

