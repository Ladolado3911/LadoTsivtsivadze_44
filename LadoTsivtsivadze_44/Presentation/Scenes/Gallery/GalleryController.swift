//
//  ViewController.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import UIKit

class GalleryController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configCollectionView() {
        
    }
}

extension GalleryController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
