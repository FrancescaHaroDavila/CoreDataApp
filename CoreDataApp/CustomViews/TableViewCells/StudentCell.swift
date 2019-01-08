//
//  StudentCellTableViewCell.swift
//  CoreDataApp
//
//  Created by Francesca Valeria Haro Dávila on 1/7/19.
//  Copyright © 2019 Belatrix. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
  
  @IBOutlet weak var txtName: UILabel!
  @IBOutlet weak var txtAge: UILabel!
  var functionInstance = Functions()
  
  @IBAction func btnDelete(_ sender: UIButton) {
  
    self.functionInstance.delete(name: txtName.text ?? "")
  }
  @IBAction func btnEdit(_ sender: UIButton) {
  }
  
}
