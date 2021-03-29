//
//  Cell.swift
//  DemoLoadMore
//
//  Created by ICAR COMPANY on 25/03/2021.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var labell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var changeListdata: ((String, [Int]) -> Void)?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func re(_ sender: Any) {
        changeListdata?("re", [])
    }
    @IBAction func minus(_ sender: Any) {
    }
    
    @IBAction func plus(_ sender: Any) {
        changeListdata?("plus", [-20, -21, -22])
    }
}
