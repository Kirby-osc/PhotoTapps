//
//  MainCollectionViewController.swift
//  PhotoTapps
//
//  Created by Дмитрий Мартьянов on 11.11.2020.
//

import UIKit


class MainCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "Cell"
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    private let foodItems = ["food1", "food2", "food3", "food4","food5","food6","food7","food8","food9", "food10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Альтернативный вариант кастомизации параметров collectionView
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 70, height: 70)
//        layout.sectionInset = sectionInsets
//        layout.minimumInteritemSpacing = 20
//        layout.minimumLineSpacing = 20
//
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "choosePic" else{
            return
        }
        let destinationVC = segue.destination as! ImageViewController
        let cell = sender as! PhotoCell
        destinationVC.photo = cell.foodImageView.image
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return foodItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
    
        cell.backgroundColor = .darkGray
        cell.layer.cornerRadius = 20
        
        let image = UIImage(named: foodItems[indexPath.item])
        cell.foodImageView.image = image
        return cell
    }


}
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let paddingWidth = sectionInsets.left * (itemsPerRow + 1)
        let avilableWidth = collectionView.frame.width - paddingWidth
        let itemWidth = avilableWidth / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }


    //Задает отступы для всех границ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    //Задает отступ между линиями объектов
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    //Задает отступ между объектами
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
