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
    
    func populateCell(pokemon: Pokemon, indexPathRow: Int) {
        self.nameLabel.text = pokemon.name
        
        self.idLabel.text = "\(String(indexPathRow)) \(String(pokemon.id))"
        
        if let shinyImageUrl = pokemon.shinyImageUrl {
            let url = URL(string: shinyImageUrl)
            self.shinyImageView.kf.setImage(with: url)
//            fetchImage(imageUrl: shinyImageUrl) { (image, error) in
//                if let error = error {
//                    print(error)
//                }
//                pokemon.shinyImage = image!
//                self.shinyImageView?.image = pokemon.shinyImage
//            }
        }
        
        if let frontImageUrl = pokemon.imageUrl {
            let url2 = URL(string: frontImageUrl)
            self.imgView.kf.setImage(with: url2)
//            fetchImage(imageUrl: frontImageUrl) { (image, error) in
//                if let error = error {
//                    print(error)
//                }
//                pokemon.image = image!
//                self.imgView.image = pokemon.image
//            }
        }
    }

}
