//
//  ViewController.swift
//  todoList
//
//  Created by Galym Anuarbek on 6/15/17.
//  Copyright © 2017 Galym Anuarbek. All rights reserved.
//

import UIKit

var anArray: [String] = []
var tasks: [String] = []
var dates: [String] = []

extension Notification.Name {
    static let reload = Notification.Name("reload")
}

class tableViewController: UITableViewController {

    @IBOutlet var myTableView: UITableView!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return anArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "ViewControllerTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.todoimage.image = UIImage(named: "\(tasks[indexPath.row]).png")
        cell.todoLabel.text = anArray[indexPath.row]
        cell.dateLabel.text = dates[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            anArray.remove(at: indexPath.row)
            tasks.remove(at: indexPath.row)
            dates.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func reloadTableData(_ notification: Notification) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: .reload, object: nil)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

