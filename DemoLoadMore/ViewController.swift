//
//  ViewController.swift
//  DemoLoadMore
//
//  Created by ICAR COMPANY on 25/03/2021.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var listNumber = [Int]()
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        for item in 0..<10 {
            listNumber.append(item)
            tableView.reloadData()
        }
        self.tableView.refreshControl = refreshControl
//        if #available(iOS 10.0, *) {
//            self.tableView.refreshControl = refreshControl
//        } else {
//            self.tableView.addSubview(refreshControl)
//        }
        
        
        // nottifition fireBase
        self.refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        
        Messaging.messaging().subscribe(toTopic: "weather") { error in
          print("Subscribed to weather topic")
        }

    }
    @objc func updateData(){
        tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Cell else {
            return UITableViewCell()
        }
        cell.labell.text = String(listNumber[indexPath.row])
        cell.changeListdata = {[weak self](key, arr) in
            if key == "plus" {
                self?.listNumber.append(66)
  
                print("đã cộng")
            }
            if key == "re" {
                tableView.reloadData()
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row < 0 {
            tableView.reloadData()
        }
    }
    
    
}
