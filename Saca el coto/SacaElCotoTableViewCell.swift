//
//  SacaElCotoTableViewCell.swift
//  Saca el coto
//
//  Created by Alfredo Fregoso on 9/12/16.
//  Copyright © 2016 AppData. All rights reserved.
//

import UIKit

class SacaElCotoTableViewCell: UITableViewCell {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet weak var promoLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.backgroundColor = UIColor(colorLiteralRed: 0.16, green: 0.17, blue: 0.21, alpha: 0.3)
        // Initialization code
        thumbnailImageView.layer.cornerRadius = 14
        thumbnailImageView.clipsToBounds = true
        
        bottomView.layer.cornerRadius = 14
        bottomView.clipsToBounds = true
        
        bottomView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
