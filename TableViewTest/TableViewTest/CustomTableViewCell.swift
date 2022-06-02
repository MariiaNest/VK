//
//  CustomTableViewCell.swift
//  CustomViewTest
//
//  Created by Maria on 14.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure (image: UIImage?, name: String?, discription: String?){
        fotoImageView.image = image
        nameLabel.text = name
        descriptionLabel.text = discription
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fotoImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
