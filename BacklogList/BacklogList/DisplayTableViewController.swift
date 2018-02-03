//
//  DisplayTableViewController.swift
//  BacklogList
//
//  Created by John Farina on 1/26/18.
//  Copyright © 2018 UNG CSCI 3660. All rights reserved.
//

import UIKit

class DisplayTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    
    private var backlogModel = BacklogModel()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backlogModel.getBacklogList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: "cell")
        let list = backlogModel.getBacklogList()[indexPath.row]
        cell.textLabel?.text = list.backlogItem
        cell.detailTextLabel?.text = list.priority
        return (cell)
    }
    

    @IBOutlet weak var displayTableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        displayTableView.reloadData()
        
    }
    override func viewDidLoad() {
         displayTableView.reloadData()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   

}
