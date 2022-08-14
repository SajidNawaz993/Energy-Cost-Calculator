//
//  CosumptionResultTableVIewCell.swift
//  Energy Cost Calculator
//
//  Created by Sajid Nawaz on 03/08/2022.
//

import Foundation
import UIKit

class CosumptionResultTableVIewCell: UITableViewCell {
    
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var consumptionCostlbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
