//
//  imageCollectionViewCell.swift
//  BehindNoticeBoard
//
//  Created by 박대희 on 2020/08/19.
//  Copyright © 2020 richard. All rights reserved.
//

import UIKit

class imageCollectionViewCell: UICollectionViewCell {
    public static let identifier = "imageCell"
    public var bgColor: UIColor? = .lightGray{
        didSet {
            self.backgroundColor = bgColor
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 80, height: 80)
       }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
}
