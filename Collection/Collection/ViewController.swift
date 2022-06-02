//
//  ViewController.swift
//  Collection
//
//  Created by Maria on 26.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //        объявление
    let reuseIdentifier = "reuseIdentifier"
    
    //        массив для расширения ViewController
    let array = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//extention  для delegate
extension ViewController: UICollectionViewDelegate{
    
}

extension ViewController: UICollectionViewDataSource { //у этого UICollectionViewDataSource есть несколько обязательных методов
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return array.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CustomCollectionViewCell
        else {return UICollectionViewCell()}
        cell.configure(text: array[indexPath.item])
        return cell
    }//тот же механизм переиспользования ячеек, как и в TableView
}
  
// сделаем размер ячеек побольше
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.collectionView.bounds.width / 2 - 20, height: self.collectionView.bounds.height / 2 - 20)
        //не поняла почему, но при return CGSize(width: self.collectionView.bounds.width / 2 - 10, height: collectionView.bounds.width / 2 - 10), ячейки становятся квадратными
    }
}
