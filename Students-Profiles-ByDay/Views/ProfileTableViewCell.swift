//
//  ProfileTableViewCell.swift
//  Students-Profiles-ByDay
//
//  Created by Steven Hertz on 11/20/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         
        accessoryType = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
        // Configure the view for the selected state
    }
    
    func setup(appProfileModel: AppProfile) {
        titleLabel.text = appProfileModel.title
        
        //        if let tripImage = tripModel.image {
        //            tripImageView.alpha = 0.3
        //            tripImageView.image = tripImage
        //
        //            UIView.animate(withDuration: 1) {
        //                self.tripImageView.alpha = 1
        //            }
        //        }
    }
    
}


class TripsTableViewCell: UITableViewCell {

//    @IBOutlet weak var cardView: UIView!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var tripImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        look at
//        cardView.addShadowAndRoundedCorners()
//        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
//        cardView.backgroundColor = Theme.accent
//        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }
    
    func setup(appProfileModel: AppProfile) {
        //titleLabel.text = appProfileModel.title
        
//        if let tripImage = tripModel.image {
//            tripImageView.alpha = 0.3
//            tripImageView.image = tripImage
//
//            UIView.animate(withDuration: 1) {
//                self.tripImageView.alpha = 1
//            }
//        }
    }
}
