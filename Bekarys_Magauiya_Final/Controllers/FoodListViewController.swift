//
//  FoodListViewController.swift
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 22.05.2022.
//

import UIKit
import Alamofire
class FoodListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    let url = "http://127.0.0.1:8000/api/get_all_foods"  //i created my own api to get foods
    @IBOutlet weak var foodtableview: UITableView!
    var foods : [Food] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        foodtableview.delegate = self
        foodtableview.dataSource = self
        get_data()
        // Do any additional setup after loading the view.
    }
    

    func get_data(){
        AF.request(self.url, method: .get).responseDecodable(of: [Food].self) { [weak self] response in
            self?.foods = response.value ?? []
            self?.foodtableview.reloadData()
        }
    }

}
extension FoodListViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodcell")
        cell?.textLabel?.text = self.foods[indexPath.row].name
        cell?.detailTextLabel?.text = self.foods[indexPath.row].ingredients
        return cell!
    }
}
