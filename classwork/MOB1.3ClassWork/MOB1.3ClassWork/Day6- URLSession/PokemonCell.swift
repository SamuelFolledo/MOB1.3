//
//  PokemonCell.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/15/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var shinyImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = UIImage()
        shinyImageView?.image = UIImage()
        nameLabel.text = ""
        idLabel.text = ""
    }

}