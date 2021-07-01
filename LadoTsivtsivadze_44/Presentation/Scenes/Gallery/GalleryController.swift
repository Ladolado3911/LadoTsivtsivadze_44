//
//  ViewController.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import UIKit

class GalleryController: BaseViewController {
    
    
    @IBOutlet weak var collectView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()

    }
    
    func configCollectionView() {
        collectView.dataSource = self
        collectView.delegate = self
        
        let nib = UINib(nibName: "ImageCell", bundle: nil)
        collectView.register(nib, forCellWithReuseIdentifier: "ImageCell")
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
