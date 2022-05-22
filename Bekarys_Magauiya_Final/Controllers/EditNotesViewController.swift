//
//  EditViewController.swift
//  Bekarys_Magauiya_Realm
//
//  Created by Bekarys Magauiya on 28.04.2022.
//

import UIKit

class EditNotesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var status = ["Done","In progress","Not done"]
    @IBOutlet weak var taskfield: UITextField!
    
    @IBOutlet weak var desfield: UITextField!
    
    @IBAction func deletebutton(_ sender: UIButton) {
        let vm = RealmManager.shared
        
        vm.delete(index: index!)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var pickerview: UIPickerView!
    
    @IBAction func changebutton(_ sender: UIButton) {
        let vm = RealmManager.shared
        
        vm.update(index: index!, taskname: taskfield.text!, taskdescription: desfield.text!, status: pickerview.selectedRow(inComponent: 0))
        self.navigationController?.popViewController(animated: true)
    }
    
    var task : Notes?

    var index : Int?
    override func viewDidLoad() {
        taskfield.attributedPlaceholder = NSAttributedString(
            string: "Enter note",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        desfield.attributedPlaceholder = NSAttributedString(
            string: "Enter description",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        super.viewDidLoad()
        pickerview.delegate=self
        pickerview.dataSource=self
        pickerview.selectRow(0, inComponent: 0, animated: true)
        // Do any additional setup after loading the view.
    }
     
    
    override func viewWillAppear(_ animated: Bool) {
        if let myTask = self.task{
            taskfield.text=myTask.taskname
            desfield.text=myTask.taskdescription
            
        }
    }

}
extension EditNotesViewController{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return status.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return status[row]
    }
}
