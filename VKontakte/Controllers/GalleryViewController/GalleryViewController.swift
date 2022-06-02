//
//  GalleryViewController.swift
//  VKontakte
//
//  Created by Maria on 01.06.2022.
//

import UIKit

class GalleryViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "reuseIdentifier"
    
    var fotoArray = [String]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    } //будет выполняться каждый раз после завершения анимации перехода
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier) //регистрируем ячейку для Gallery
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
}

extension GalleryViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotoArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? GalleryCollectionViewCell else {
            return UICollectionViewCell()}
        cell.configure(image: UIImage(named: fotoArray[indexPath.item]))
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        let imageView = UIImageView(frame: view.frame)
        self.view.addSubview(view)
        view.addSubview(imageView)
        imageView.image = UIImage(named: fotoArray[indexPath.item])
        imageView.contentMode = .scaleAspectFit //для того, чтобы не растягивало картинку на весь экран
        //добавили вьюшку, на нее положили imageView, и на imageView загрузили картинку
        //мы также должны прописать rollback вьюшки
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: collectionView.bounds.width / 2 - 10)
    }
}
