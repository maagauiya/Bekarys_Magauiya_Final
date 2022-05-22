//
//  ListofButtonsViewController.swift
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 22.05.2022.
//

import UIKit
import FirebaseAuth
class ListofButtonsViewController: UIViewController {

    
  
    
    @IBAction func GymButton(_ sender: UIButton) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "petition") as! PetitionViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func HelpButton(_ sender: UIButton) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "help") as! HelpdeskViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func NotesButton(_ sender: UIButton) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Notes") as! NotesViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func CalendarButton(_ sender: UIButton) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "foodlist") as! FoodListViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    override func viewDidLoad() {
        let button = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(beka))
        navigationItem.rightBarButtonItem=button
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true;
        // Do any additional setup after loading the view.
    }
    @objc func beka(){
        do { try Auth.auth().signOut() }
        catch { print("already logged out") }
        navigationController?.popToRootViewController(animated: true)
    }
    

}
