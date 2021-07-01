//
//  ViewController.swift
//  LadoTsivtsivadze_44
//
//  Created by lado tsivtsivadze on 7/1/21.
//

import UIKit

class GalleryController: BaseViewController {
    
    @IBOutlet weak var collectView: UICollectionView!
    var pictures: [String]? {
        guard let pictures = filesManager.readPictures() else { return nil }
        let result = pictures.filter { $0.suffix(3).contains("png") }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        let button = UIBarButtonItem(title: "Add",
                                     style: .done,
                                     target: self,
                                     action: #selector(add))
        
        navigationItem.rightBarButtonItem = button

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //guard let pictures = pictures else { return }
        collectView.reloadData()
    }
    
    func configCollectionView() {
        collectView.dataSource = self
        collectView.delegate = self
        
        let nib = UINib(nibName: "ImageCell", bundle: nil)
        collectView.register(nib, forCellWithReuseIdentifier: "ImageCell")
    }
    
    @objc func add(_ sender: UIBarButtonItem) {
        coordinator?.proceedToDraw()
    }
}

extension GalleryController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let pictures = pictures else { return 0 }
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell
        guard let pictures = pictures else { return UICollectionViewCell() }
        let image = filesManager.loadImage(at: pictures[indexPath.row])
        print(image)
        cell!.image = image
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - 6) / 3
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
}
