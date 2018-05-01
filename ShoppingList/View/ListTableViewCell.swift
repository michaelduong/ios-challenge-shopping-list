//
//  ListTableViewCell.swift
//  ShoppingList
//
//  Created by Michael Duong on 1/26/18.
//  Copyright © 2018 Turnt Labs. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.buttonCellTapped(_sender: self)
    }
    
    var delegate: ListTableViewCellDelegate?
    
    func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "complete" : "incomplete"
        completeButton.setImage(UIImage(named: imageName), for: .normal)
    }
}

extension ListTableViewCell {
    func update(withItem item: Item) {
        itemLabel.text = item.name
        updateButton(item.isComplete)
    }
}

protocol ListTableViewCellDelegate {
    func buttonCellTapped(_sender: ListTableViewCell)
}
