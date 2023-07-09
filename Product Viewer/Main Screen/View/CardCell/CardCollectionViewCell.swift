//
//  CardCollectionViewCell.swift
//  Product Viewer
//
//  Created by Mohamed Mostafa on 11/06/2023.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CardCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardPriceLabel: UILabel!
    @IBOutlet weak var cardDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(item: ProductCoreData) {
        cardTitleLabel.text = item.title
        cardPriceLabel.text = (item.price ?? "0") + "$"
        cardDescriptionLabel.text = item.descriptions
        if let data = item.image {
            cardImageView.image = UIImage(data: data)
        } else {
            cardImageView.image = UIImage(systemName: "photo")
        }
    }
    

}
