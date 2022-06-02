//
//  GalleryCollectionViewCell.swift
//  VKontakte
//
//  Created by Maria on 01.06.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fotoImageView: UIImageView!
    
//напишем конфигуратор для Gallety
    func configure(image: UIImage?){
        fotoImageView.image = image
    }
    
    
//для переиспользования ячейки напишем метод
    override func prepareForReuse(){
        super.prepareForReuse()
        fotoImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
