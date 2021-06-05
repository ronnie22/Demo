//
//  FTableViewCell.swift
//  Demo
//
//  Created by Raunak Sinha on 05/06/21.
//

import UIKit

class FTableViewCell: UITableViewCell {

    
    var delegate:MyCustomCellDelegator!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = backView.frame.size.height / 10
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        backView.addGestureRecognizer(tap)
        // Initialization code
    }

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        if delegate != nil {
            delegate.callSegueFromCell()
        }
    }
    
}
