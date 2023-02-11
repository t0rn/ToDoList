//
//  ViewController.swift
//  ToDoList
//
//  Created by Alexey Ivanov on 4/2/23.
//

import UIKit

let xs = ( "foo", 1, Double(10) )

class BuildingDictStorage {
    lazy var myDictionary: [String: UIImage] = {
        let newDict = createDictanary(array1: buildings, array2: buildingsImage)
        return newDict
    }()
    
    let buildingsImage = [UIImage (named: "Miner")!,UIImage (named: "Oil Pump")!, UIImage (named: "Water Pump")!, UIImage (named: "Resource Well Pressurizer")!,UIImage (named: "Resource Well Extractor")!, UIImage(named: "Smalter")!, UIImage(named: "Constructor")!]
    
    let buildings = ["Miners", "Oil Extractors", "Water Extractors", "Resource Well Pressurizers", "Resource Well Extractors", "Smelter", "Constructor"]
    
    func save(key: String, image: UIImage) {
        myDictionary[key] = image
    }
    
    func get(key: String) -> (String, UIImage)? {
        let name = key
        if let value = myDictionary[key] {
            return (name, value)
        }
        return nil
    }
    
    private func createDictanary (array1 : [String], array2 : [UIImage]) -> [String:UIImage]{
        var dict : [String:UIImage] = [:]
        for (k, v) in zip(buildings, buildingsImage){
            dict[k] = v
        }
        return dict
        
    }
}







class ViewController: UIViewController, UITableViewDataSource {
    
    let list = ["Foo",
                "Bar",
                "Awesome",
                nil]

    let storage = BuildingDictStorage()
    
    var emptyDict = [String: UIImage]()
    
    let notLazyDict = [
        "Miners" : UIImage(named: "Miner")!,
        "Oil Extractors" : UIImage(named: "Oil Pump")!
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let buiding = Builing(name: "foo", image: <#T##UIImage#>)
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
            detailsVC.storage = self.storage
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}




class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    
    
}



