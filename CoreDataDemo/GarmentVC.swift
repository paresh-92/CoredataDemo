//
//  GarmentVC.swift
//  SQLLiteDemo
//
//  Created by Paresh Thakkar on 16/07/21.
//

import UIKit
class GarmentVC: UIViewController {

    @IBOutlet weak var tblList: UITableView!
    @IBOutlet weak var btnAlphabate: UIButton!
    @IBOutlet weak var btncreationDate: UIButton!

    
    var model = [DemoList]()
    var model1 = DemoList()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        readData()
    }
    @IBAction func btnAlphabaticClicked(_ sender: UIButton) {
        self.btncreationDate.backgroundColor = .clear
        self.btnAlphabate.backgroundColor = #colorLiteral(red: 0.7529411765, green: 0.7529411765, blue: 0.7529411765, alpha: 1)
        setByAlphabatecOrder()
        tblList.reloadData()
    }
    @IBAction func btnCreationTimeClicked(_ sender: UIButton) {
        self.btncreationDate.backgroundColor = #colorLiteral(red: 0.7529411765, green: 0.7529411765, blue: 0.7529411765, alpha: 1)
        self.btnAlphabate.backgroundColor = .clear
        setByDateOrder()
        tblList.reloadData()

    }
    @IBAction func btnAddClicked(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "GarmainDetailVC") as! GarmainDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func readData()
    {
        do{
            model = try context.fetch(DemoList.fetchRequest())
            print(model)
            DispatchQueue.main.async {
                self.setByAlphabatecOrder()
                self.tblList.reloadData()
            }
        }
        catch
        {
            print("Error")
        }
    }
    func setByAlphabatecOrder()
    {
        self.model.sort{
            (($0.name) ?? "") < (($1.name) ?? "")
        }
    }
    func setByDateOrder()
    {
        self.model.sort{
            (($0.date) ?? "") < (($1.date) ?? "")
        }
    }
}
extension GarmentVC: UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblList.dequeueReusableCell(withIdentifier: "GarmentCell", for: indexPath) as! GarmentCell
        let model1 = model[indexPath.row]
        cell.lblGarmentName.text = model1.name
        return cell
    }
    
    
}
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

