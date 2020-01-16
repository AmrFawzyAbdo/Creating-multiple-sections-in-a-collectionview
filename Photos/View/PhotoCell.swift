//
//  PhotoCell.swift
//  Photos
//
//  Created by Apple on 1/15/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell : UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var imageName : String! {
        didSet{
            photoImageView.image = UIImage(named: imageName)
        }
    }
}
