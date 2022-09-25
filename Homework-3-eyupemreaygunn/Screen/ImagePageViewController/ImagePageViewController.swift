//
//  ImagePageViewController.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 20.09.2022.
//

import UIKit
import Kingfisher

class ImagePageViewController: UIViewController {
    @IBOutlet weak var ImagecollectionView: UICollectionView!
    private let viewModel = ImagePageViewModel()
    private var items2: [PhotosCellViewModel] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImagecollectionView.dataSource = self
        ImagecollectionView.delegate = self
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
        registerCell()
        designUI()
        
        
        
    }
    
}
extension ImagePageViewController: ImagePageViewModelViewProtocol {
    func didCellItemFetch(_ items2: [PhotosCellViewModel]) {
        self.items2 = items2
        DispatchQueue.main.async {
            self.ImagecollectionView.reloadData()
            self.ImagecollectionView.reloadInputViews()
        }
        
        
    }
    func showEmptyView() {
        
    }
    func hideEmptyView() {
        
    }
    func registerCell() {
        ImagecollectionView.register(UINib(nibName: "ImagePageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        
    }
    func designUI() {
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 5
        design.minimumLineSpacing = 5
        let width = view.frame.size.width
        let heigth = view.frame.size.height
        let hucreGenislik = (width - 30)
        design.itemSize = CGSize(width: hucreGenislik, height: heigth / 3 )
        ImagecollectionView.collectionViewLayout = design
        
    }
}

extension ImagePageViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //         let item = items2[indexPath.row]
        
        let cell = ImagecollectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! ImagePageCollectionViewCell
                
        if let url = items2[indexPath.row].url {
            cell.imagePageImage.kf.setImage(with: URL(string: url))
        }
        
        if let thumbnailUrl = items2[indexPath.row].thumbnailUrl {
            cell.image2.kf.setImage(with: URL(string: thumbnailUrl))
        }
        
        cell.albumTitle.text = items2[indexPath.row].title
        
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
    }
    
    
}

