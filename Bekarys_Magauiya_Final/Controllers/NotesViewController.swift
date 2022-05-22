//
//  NotesViewController.swift
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 22.05.2022.
//

import UIKit
import RealmSwift
class NotesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var NotesTableView: UITableView!
    let vm = RealmManager.shared
    let realm = try! Realm()
    
    
    var a = [Notes]()
    override func viewDidLoad() {
        print(vm.tasks)
        super.viewDidLoad()
        NotesTableView.delegate=self
        NotesTableView.dataSource=self
    }

    override func viewDidAppear(_ animated: Bool) {
//        self.data.removeAll()
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(beka))
        navigationItem.rightBarButtonItem=button
        a = vm.loadtasks()
        NotesTableView.reloadData()
            
        
    }
    @objc func beka(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddtaskViewController") as! AddNoteViewController
            navigationController?.pushViewController(vc, animated: true)
    }

}
extension NotesViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = a[indexPath.row].taskname
        cell?.detailTextLabel?.text = a[indexPath.row].taskdescription
        if a[indexPath.row].taskstatus == 0{
            cell?.backgroundColor = UIColor.green
            
        }
        else if a[indexPath.row].taskstatus == 1 {
            cell?.backgroundColor = UIColor.orange
        }
        else{
            cell?.backgroundColor = UIColor.red
        }

        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditNotesViewController
        vc.task = a[indexPath.row]
        vc.index = indexPath.row

        navigationController?.pushViewController(vc, animated: true)
    }
    
}


