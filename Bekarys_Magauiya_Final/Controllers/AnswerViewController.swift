//
//  AnswerViewController.swift
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 22.05.2022.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class AnswerViewController: UIViewController {
    let database = Database.database().reference()
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var yourquestion: UILabel!
    
    @IBOutlet weak var answerhelp: UILabel!
    @IBOutlet weak var AnswerLabel: UILabel!
    let userID = Auth.auth().currentUser?.uid
    override func viewDidLoad() {
        let button = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(beka))
        navigationItem.rightBarButtonItem=button
        answerhelp.adjustsFontSizeToFitWidth = true
        answerhelp.minimumScaleFactor = 0.5
        let userID = Auth.auth().currentUser?.uid
        database.child(userID!).observeSingleEvent(of: .value, with: { snapshot in
          // Get user value
          let value = snapshot.value as? NSDictionary
      
            self.yourquestion.text = value?["Question"] as? String ?? ""
            self.answerhelp.text = value?["Answer"] as? String ?? ""
          // ...
        }) { error in
          print(error.localizedDescription)
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc func beka(){
        self.database.child(userID!).setValue(nil)
        let alert = UIAlertController(title: "Your question is successfully deleted", message:   "You will redirected to main page", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: { _ -> Void in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ListView") as! ListofButtonsViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
            })
            alert.addAction(OKAction)
        self.present(alert, animated: true){}
    }
    


}
