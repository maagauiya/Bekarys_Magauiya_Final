//
//  RealmManager.swift
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 22.05.2022.
//

import Foundation
import RealmSwift

class RealmManager  {
    
    static var shared = RealmManager()
    var  tasks = [Notes]()
    
    typealias completionHandler = () -> Void
    
    let realm = try! Realm()
    
    
    func saveTask(taskname:String,taskdescription:String,status:Int){
        try! realm.write{
            let task = Notes()
            task.taskname=taskname
            task.taskdescription=taskdescription
            task.taskstatus=status
            realm.add(task)
        }
    }
    
    
    func loadtasks() -> [Notes]{
        tasks.removeAll()
        self.realm.beginWrite()
        let w = realm.objects(Notes.self)
        for i in w{
            tasks.append(i)
        }
        try! self.realm.commitWrite()
        return tasks
    }
    
    func delete(index: Int){
        self.realm.beginWrite()
        
        let e = realm.objects(Notes.self)
        var a = 0
        for i in e {
            if a==index{
                realm.delete(i)
            }
            a=a+1
        }
       try! self.realm.commitWrite()
    }
    func update(index: Int,taskname:String,taskdescription:String,status:Int){
        let e = realm.objects(Notes.self)
        var a = 0
        for i in e {
            if a==index{
                try! realm.write{
                    i.taskname=taskname
                    i.taskdescription=taskdescription
                    i.taskstatus=status
                }
            }
            a=a+1
        }
    }
    
}
