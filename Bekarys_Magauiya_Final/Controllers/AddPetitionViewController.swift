//
//  AddPetitionViewController.swift
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 23.05.2022.
//

import UIKit
import FirebaseDatabase

class AddPetitionViewController: UIViewController {
    let database = Database.database().reference()
    @IBAction func send(_ sender: UIButton) {
        
        database.child("petitions").child(titlefield.text!).setValue(descripfield.text!)
        let alert = UIAlertController(title: "Your idea is successfully added", message:   "Thanks", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: { _ -> Void in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "petition") as! PetitionViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
            })
            alert.addAction(OKAction)
        self.present(alert, animated: true){}
    }
    @IBOutlet weak var titlefield: UITextField!
    
    @IBOutlet weak var descripfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
