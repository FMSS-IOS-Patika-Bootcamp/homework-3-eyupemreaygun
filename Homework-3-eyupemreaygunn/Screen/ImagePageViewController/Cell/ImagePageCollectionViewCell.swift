//
//  ImagePageCollectionViewCell.swift
//  Homework-3-eyupemreaygunn
//
//  Created by Eyüp Emre Aygün on 20.09.2022.
//

import UIKit

class ImagePageCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet private(set) weak var imagePageImage: UIImageView!
    
    @IBOutlet private(set) weak var image2: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
