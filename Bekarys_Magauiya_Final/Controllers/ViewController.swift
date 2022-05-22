//
//  ViewController.swift
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 22.05.2022.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var EmailField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBAction func SigninButton(_ sender: UIButton) {
        
        
        Auth.auth().signIn(withEmail: (EmailField.text!+"@astanait.edu.kz"), password: (PasswordField.text!)) { (result, error) in
                    if let _eror = error{
                        let alert = UIAlertController(title: "Incorrect password ", message: "Please, try again", preferredStyle: UIAlertController.Style.alert)
                               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                               self.present(alert, animated: true, completion: nil)
                    }else{
                        if let _res = result{
                        
                            
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let newController = storyBoard.instantiateViewController(withIdentifier: "ListView") as! ListofButtonsViewController
                            self.navigationController?.pushViewController(newController, animated: true)                        }
                    }
                }
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}

