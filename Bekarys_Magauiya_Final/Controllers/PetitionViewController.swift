//
//  PetitionViewController.swift
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 23.05.2022.
//

import UIKit
import FirebaseDatabase
class PetitionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var keys = [String]()
    var values = [String]()
    let database = Database.database().reference()
    @IBOutlet weak var Ptableview: UITableView!
    override func viewDidLoad() {
        get_keys()
        get_values()
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(beka))
        navigationItem.rightBarButtonItem=button
        super.viewDidLoad()
        Ptableview.dataSource = self
        Ptableview.delegate = self
    }
    @objc func beka(){
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addpetition") as! AddPetitionViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func get_keys(){
        getkeys{ keys in
            self.keys = keys
            self.Ptableview.reloadData()
            
        }
    }
    func get_values(){
        getvalues{ values in
            self.values = values
            self.Ptableview.reloadData()
            
        }
    }


}
extension PetitionViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellp")
        cell?.textLabel?.text = keys[indexPath.row]
        cell?.detailTextLabel?.text = values[indexPath.row]
        return cell!
    }
    func getkeys(completion: @escaping ([String]) -> ()){
        database.child("petitions").observeSingleEvent(of: .value, with: { snapshot in
          let value = snapshot.value as? NSDictionary
            var keys = [String]()
            for i in value!{
                keys.append(i.key as! String)

            }
            completion(keys)
        }) { error in
          print(error.localizedDescription)
        }
    }
    func getvalues(completion: @escaping ([String]) -> ()){
        database.child("petitions").observeSingleEvent(of: .value, with: { snapshot in
          let value = snapshot.value as? NSDictionary
            var values = [String]()
            for i in value!{
                values.append(i.value as! String)

            }
            completion(values)
        }) { error in
          print(error.localizedDescription)
        }
    }
   
}
