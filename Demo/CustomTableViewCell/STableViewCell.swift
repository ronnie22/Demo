//
//  STableViewCell.swift
//  Demo
//
//  Created by Raunak Sinha on 05/06/21.
//

import UIKit

class STableViewCell: UITableViewCell {
    
    
    var delegate:MyCustomCellDelegator!

    @IBOutlet weak var firstBackView: UIView!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    
    @IBOutlet weak var secondBackView: UIView!
    
    
    @IBOutlet weak var secondNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstBackView.layer.cornerRadius = firstBackView.frame.size.height / 10
        secondBackView.layer.cornerRadius = secondBackView.frame.size.height / 10
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        firstBackView.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        secondBackView.addGestureRecognizer(tap2)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        if delegate != nil {
            delegate.callSegueFromCell()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
