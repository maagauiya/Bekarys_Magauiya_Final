//
//  HelpdeskViewController.swift
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 22.05.2022.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
class HelpdeskViewController: UIViewController {
    
    let userID = Auth.auth().currentUser?.uid
    let email = Auth.auth().currentUser?.email
    let database = Database.database().reference()
    @IBOutlet weak var QuestionField: UITextField!
    
    @IBOutlet weak var EmailField: UITextField!
    
    @IBAction func SendButton(_ sender: UIButton) {
        self.database.child(userID!).child("Question").setValue(QuestionField.text!)
        self.database.child(userID!).child("Answer").setValue("")
        self.database.child(userID!).child("Additional").setValue(EmailField.text!)
        self.database.child(userID!).child("email").setValue(email!)
        self.database.child(userID!).child("userID").setValue(userID!)
        let alert = UIAlertController(title: "Your question is successfully send", message:   "Please wait", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: { _ -> Void in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ListView") as! ListofButtonsViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
            })
            alert.addAction(OKAction)
        self.present(alert, animated: true){}
    }
    
    
   
    override func viewDidLoad() {
        let button = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(beka))
        navigationItem.rightBarButtonItem=button
        super.viewDidLoad()
    }
    @objc func beka(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "answer") as! AnswerViewController
            navigationController?.pushViewController(vc, animated: true)
    }
    

}
