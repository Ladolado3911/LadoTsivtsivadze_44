//
//  ImageCell.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    var image: UIImage?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let image = image else { return }
        imgView.frame = bounds 
        imgView.image = image
    }
}
