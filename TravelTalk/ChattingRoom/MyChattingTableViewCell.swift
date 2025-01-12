//
//  MyChattingTableViewCell.swift
//  TravelTalk
//
//  Created by 박준우 on 1/13/25.
//

import UIKit

class MyChattingTableViewCell: UITableViewCell {

    static let id = "MyChattingTableViewCell"
    
    
    @IBOutlet weak var chatView: UIView!
    
    @IBOutlet weak var chatLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chatView.backgroundColor = UIColor.systemGray6
        chatView.layer.cornerRadius = 10
        chatView.layer.borderWidth = 0.5
        chatView.layer.borderColor = UIColor.black.cgColor
        chatLabel.numberOfLines = 0
        dateLabel.font = UIFont.systemFont(ofSize: 13)
        dateLabel.textColor = UIColor.lightGray
    }
}
