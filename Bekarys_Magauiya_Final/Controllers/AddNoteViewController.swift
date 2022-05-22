
//  Bekarys_Magauiya_Final
//
//  Created by Bekarys Magauiya on 22.05.2022.
//
//

import UIKit

class AddNoteViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    var status = ["Done","In progress","Not done"]

    
    @IBOutlet weak var taskField: UITextField!
    
    
    @IBOutlet weak var DesField: UITextField!
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    @IBAction func Savebutton(_ sender: UIButton) {
    
        let vm = RealmManager.shared
        vm.saveTask(taskname:taskField.text!,taskdescription:DesField.text!,status:PickerView.selectedRow(inComponent: 0))
        
        self.navigationController?.popViewController(animated: true)
  
    }
    
    override func viewDidLoad() {
        taskField.attributedPlaceholder = NSAttributedString(
            string: "Enter note",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        DesField.attributedPlaceholder = NSAttributedString(
            string: "Enter description",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        super.viewDidLoad()
        PickerView.dataSource=self
        PickerView.delegate=self
    }

}
extension AddNoteViewController{
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
