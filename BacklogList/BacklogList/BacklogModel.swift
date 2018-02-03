//
//  BacklogModel.swift
//  BacklogList
//
//  Created by John Farina on 1/26/18.
//  Copyright © 2018 UNG CSCI 3660. All rights reserved.
//

import Foundation
import CoreData
class BacklogModel
{
    var backlogList: [Backlog] = []
    
    var backlogItem: String = "", priority: String = ""
    func saveData(backlogItem: String, priority: String)
    {
        let newBacklogItem = Backlog(context: AppDelegate.context)
        newBacklogItem.backlogItem = backlogItem
        newBacklogItem.priority = priority
        print(newBacklogItem)
        
       // If statements that determines what emoji should be used based on the user's priority choice
        if priority == "High"{
            var emo:String
            emo = "😱"
            print(emo)
            newBacklogItem.priority = emo
        }
        
        if priority == "Medium"{
            var emo:String
            emo = "😓"
            print(emo)
            newBacklogItem.priority = emo
        }
        
        if priority == "Low"{
            var emo:String
            emo = "😎"
            print(emo)
            newBacklogItem.priority = emo
        }
        do{
            try AppDelegate.context.save()
            
            
        }catch
        {
            print("There is an error in the code")
        }
    }
    func getBacklogList()-> [Backlog]
    {
        do {
            
            backlogList = try AppDelegate.context.fetch(Backlog.fetchRequest())
            
        }
        catch
        {
            print("Fetching failed")
        }
        
        return backlogList
    }
    
}






