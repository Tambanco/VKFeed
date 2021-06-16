//
//  NewsfeedCell.swift
//  VKFeed
//
//  Created by tambanco 🥳 on 16.06.2021.
//

import Foundation
import UIKit

class NewsfeedCell: UITableViewCell {
    
    static let reuseId = "NewsfeedCell"
    
    // MARK: - Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var LikesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
