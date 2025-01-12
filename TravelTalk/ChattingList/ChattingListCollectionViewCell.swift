//
//  ChattingListCollectionViewCell.swift
//  TravelTalk
//
//  Created by 박준우 on 1/12/25.
//

import UIKit

class ChattingListCollectionViewCell: UICollectionViewCell {

    static let id = "ChattingListCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastChatLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.contentMode = .scaleAspectFit
        nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        lastChatLabel.font = UIFont.systemFont(ofSize: 15)
        lastChatLabel.textColor = UIColor.lightGray
        dataLabel.font = UIFont.boldSystemFont(ofSize: 13)
        dataLabel.textAlignment = .center
        dataLabel.textColor = UIColor.lightGray
    }
}
