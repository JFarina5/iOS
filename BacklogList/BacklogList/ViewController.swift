//
//  ViewController.swift
//  BacklogList
//
//  Created by John Farina on 1/22/18.
//  Copyright © 2018 UNG CSCI 3660. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  private var backlogModel = BacklogModel()
    var priority: String = ""
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backlogModel.getBacklogList().count
    }
    // Function that sets what the UITables will look like
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        let list = backlogModel.getBacklogList()[indexPath.row]
        cell.textLabel?.text = list.backlogItem
        cell.detailTextLabel?.text = list.priority
        return (cell)
    }
    
    // Function that initiates the priority control
    @IBAction func touchPriority(_ sender: UISegmentedControl) {
        priority = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        
    }
    
    @IBOutlet weak var tableViewOutlet: UITableView! // Initialization of the tableViewOutlet
    @IBAction func touchAdd(_ sender: UIButton) { // Function that initializes the Add button and saves             the user's input once selected
        backlogModel.saveData(backlogItem: backlogTextOutlet.text!, priority: priority)
         tableViewOutlet.reloadData()
         backlogTextOutlet.text = ""
    }
    @IBOutlet weak var backlogTextOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }




}


