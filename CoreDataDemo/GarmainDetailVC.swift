//
//  GarmainDetailVC.swift
//  SQLLiteDemo
//
//  Created by Paresh Thakkar on 16/07/21.
//

import UIKit


class GarmainDetailVC: UIViewController {

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var date = String()
    
    @IBOutlet weak var txtGarmentName: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSaveClicked(_ sender: UIButton) {
        isertDataInDataBase()
    }
    
}
extension GarmainDetailVC
{
    func isertDataInDataBase()
    {
        let newItem = DemoList(context: context)
        newItem.name = txtGarmentName.text
        let dateFormatter = DateFormatter()
        let datePicker = UIDatePicker()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        date = dateFormatter.string(for: datePicker.date)!
        newItem.date = date
        
        do
        {
            try context.save()
            self.navigationController?.popViewController(animated: true)
        }
        catch
        {
            print("Error")
        }
    }
}
