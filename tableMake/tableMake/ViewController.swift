//
//  ViewController.swift
//  tableMake
//
//  Created by Induk CS on 2022/05/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "myCell")
        cell.textLabel?.text = "\(indexPath.row)"
        cell.detailTextLabel?.text = indexPath.description
        cell.imageView?.image = UIImage(named: "green.png")!
        print(indexPath.description, separator:" ", terminator: " ")
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

