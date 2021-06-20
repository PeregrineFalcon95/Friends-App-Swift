//
//  CollectionViewCell.swift
//  Friends
//
//  Created by Amit Sarker on 6/19/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    public func configure ( image: UIImage, name: String, country: String ){
        imageView.image = image
        nameLabel.text = name
        countryLabel.text = country
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    deinit {
        print("Collection View Cell Deinit")
    }
}
