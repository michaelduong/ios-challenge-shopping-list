//
//  ListTableViewCell.swift
//  ShoppingList
//
//  Created by Aaron Eliason on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    var item: Item?
    
    
    weak var delegate: ItemTableViewCellDelegate?
    
    

    @IBOutlet weak var isCheckedSwitchOutlet: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWithItem(item: Item) {
        
        self.item = item
        isCheckedSwitchOutlet.on = (item.isComplete?.boolValue)!
        if (item.isComplete != nil) {
            isCheckedSwitchOutlet.onImage = UIImage(named: "incomplete")
        } else {
            isCheckedSwitchOutlet.offImage = UIImage(named: "complete")
        }
        
        
//        if item.isComplete == 1 {
//            isCheckedSwitchOutlet.on = true
//        } else {
//            isCheckedSwitchOutlet.on = false
//        }
//        
        
        
    }
    

}
protocol ItemTableViewCellDelegate: class  {
    func ItemValueChangedCell(cell: ListTableViewCell, selected: Bool)
}
