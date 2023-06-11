//
//  MainViewController.swift
//  Product Viewer
//
//  Created by Mohamed Mostafa on 10/06/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCardCollectionViewCell()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func registerCardCollectionViewCell() {
        collectionView.register(CardCollectionViewCell.nib(), forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell
        cell?.cardImageView.image = UIImage(systemName: "person.fill")
        cell?.cardTitleLabel.text = "Man"
        cell?.cardPriceLabel.text = "20"
        cell?.cardDescriptionLabel.text = "this a man fore sale if you like to have one."
        
        return cell ?? UICollectionViewCell()
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        return CGSize(width: width/2.2, height: width/1.8)
    }
}
