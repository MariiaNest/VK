//
//  CustomCollectionViewCell.swift
//  Collection
//
//  Created by Maria on 26.05.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var yellowLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        yellowLabel.text = nil // очистка лейбла
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
//    конфигуратор
    func configure(text: String){
        yellowLabel.text = text
    }

}
