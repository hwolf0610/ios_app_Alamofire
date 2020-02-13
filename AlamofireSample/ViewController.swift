//
//  ViewController.swift
//  AlamofireSample
//
//  Created by Admin on 2/14/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableviewLabel: UITableView!
    var categories: [CategoriesModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategories();
        // Do any additional setup after loading the view.
    }
    
    func getCategories(){
        ProgressHud.shared.show(view: view, msg: "")
        APIService.shared.getQuestionCategories(completion: {
            error, res in
            ProgressHud.shared.dismiss()
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let response = res as! [String: Any]
                let status = response["status"] as! Int
                if status == 200 {
                    let data = response["data"] as! [Any]
                    for d in data {
                        let dict = d as! [String: Any]
                        let categroy = CategoriesModel(category: dict)
                        self.categories.append(categroy)
                    }
                    self.tableviewLabel.reloadData()
                } else {
                    let message = response["message"] as! String
                    print(message)
                }
            }
        })
        
    }
    


}


extension ViewController : UITableViewDataSource{

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "labelTableViewCell", for: indexPath) as! labelTableViewCell
    
    let category = categories[indexPath.row]
    cell.cellLabel.text = category.name
    
    return cell
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableview: UITableView, heightForRowAt indexPath : IndexPath) ->CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        self.getQuestions()
        print("selected!!!")
    }
}

