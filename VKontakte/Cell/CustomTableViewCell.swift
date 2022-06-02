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
    
    func configure(group: Group){
        if let avatarPath = group.avatarImagePath {
            fotoImageView.image = UIImage(named: avatarPath)
        }
        nameLabel.text = group.name
        descriptionLabel.text = group.description
    }
    
    //напишем конфигуратор для friend
    func configure(friend: Friend){
        if let avatarPath = friend.avatar {
            fotoImageView.image = UIImage(named: avatarPath)
        }
        nameLabel.text = friend.name
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

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//    }
    
}
