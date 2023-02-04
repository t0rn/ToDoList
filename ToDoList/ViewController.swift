//
//  ViewController.swift
//  ToDoList
//
//  Created by Alexey Ivanov on 4/2/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let list = ["Foo",
                "Bar",
                "Awesome",
                nil]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        var string: String? = nil
        
        //раавна записи
        var string1 = Optional("foo")
       
        if let nonOptionalString = string {
            print(nonOptionalString)
        }
    
        guard let nonOptionalString = string else {
            return
        }
        print(nonOptionalString)
        
        
        
        let x = string1 ?? "none string"
        print(x == "foo")
    }
    
    //MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let title = list[indexPath.row] ?? "No value"
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellId",
                                                 for: indexPath)
        guard let myCell = cell as? MyTableViewCell else {
            return cell
        }
        
        myCell.mainLabel.text = title
        return myCell
    }

}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(
//            withIdentifier: "showDetails",
//            sender: nil
//        )
        if let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsViewController {
            let title = list[indexPath.row]
            detailsVC.text = title
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}




class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    
    
}



