//
//  GifCell.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/5/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

class GifCell: UITableViewCell {
    static let identifier: String = "gifCell"
    var gif: Gif? /// Gif to be displayed.
    var gifView: UIImageView = { /// ImageView to contain our gif.
        let v = UIImageView()
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Make sure cell has a gif object
        if gif != nil {
            // Grab gif from gif object and display it inside the imageview
            let gifURL = gif!.getGifURL()
            gifView.image = UIImage.gif(url: gifURL)
            gifView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
            addSubview(gifView)
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
