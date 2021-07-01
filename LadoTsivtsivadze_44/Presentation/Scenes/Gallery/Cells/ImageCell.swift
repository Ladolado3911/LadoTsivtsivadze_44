//
//  ImageCell.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    var imageView: UIImageView?
    var image: UIImage?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let image = image else { return }
        imageView = UIImageView()
        imageView!.frame = bounds
        imageView!.image = image
        imageView!.backgroundColor = .red
        imageView!.layer.borderWidth = 0.5
        imageView!.layer.borderColor = UIColor.black.cgColor
        addSubview(imageView!)
        //imgView.image = image
    }
}
