//
//  OtherChattingTableViewCell.swift
//  TravelTalk
//
//  Created by 박준우 on 1/13/25.
//

import UIKit

class OtherChattingTableViewCell: UITableViewCell {

    static let id = "OtherChattingTableViewCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var chatView: UIView!
    
    @IBOutlet weak var chatLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.borderWidth = 0.5
        profileImage.layer.borderColor = UIColor.black.cgColor
        chatView.layer.cornerRadius = 10
        chatView.layer.borderWidth = 0.5
        chatView.layer.borderColor = UIColor.black.cgColor
        chatLabel.numberOfLines = 0
        dateLabel.font = UIFont.systemFont(ofSize: 13)
        dateLabel.textColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
