//
//  DetailsViewController.swift
//  ToDoList
//
//  Created by Alexey Ivanov on 4/2/23.
//

import UIKit

class DetailsViewController: UIViewController {
    var text: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let storageKey = "MyList"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = text
        write()
    }
    
    func write() {
        let xs = [1,2,3,4,5]
//        let x = MyStruct(string: "foo", value: 3)
        UserDefaults.standard.set(xs, forKey: storageKey)
    }
    
    
    func read() {
        guard let x = UserDefaults.standard.object(forKey: storageKey) as? [Int]
        else {return }
        print(x)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        read()
    }
}

struct MyStruct {
    let string: String
    let value: Int
}
