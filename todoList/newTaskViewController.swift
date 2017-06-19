//
//  newTaskViewController.swift
//  todoList
//
//  Created by Galym Anuarbek on 6/15/17.
//  Copyright © 2017 Galym Anuarbek. All rights reserved.
//


import UIKit

class newTaskViewController: UIViewController {
    
    var chooseImage: String = "airplane"
    var dateChosen: String = ""
    
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    @IBAction func drunkButton(_ sender: Any) {
        chooseImage = "airplane"
    }
    
    @IBAction func jobButton(_ sender: Any) {
        chooseImage = "chair"
    }
    
    @IBAction func restButton(_ sender: Any) {
        chooseImage = "coding"
        
    }
    
    @IBAction func travelButton(_ sender: Any) {
        chooseImage = "idea"
    }
    
    @IBAction func doneButton(_ sender: Any) {
        
        tasks.append(chooseImage)
        anArray.append(todoTextField.text!)
        dates.append(dateChosen)
        NotificationCenter.default.post(name: .reload, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    func dateChanged(_ sender: UIDatePicker) {
        let componenets = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = componenets.day, let month = componenets.month, let year = componenets.year {
            dateChosen = "\(day) \(month) \(year)"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        dateChanged(datePicker)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
