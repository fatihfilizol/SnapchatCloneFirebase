//
//  FeedCell.swift
//  SnapchatClone
//
//  Created by Fatih Filizol on 22.09.2022.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var feedUserNameLabel: UILabel!
    
    @IBOutlet weak var feedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
