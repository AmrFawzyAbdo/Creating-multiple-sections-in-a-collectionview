//
//  SectionHeaderView.swift
//  Photos
//
//  Created by Apple on 1/16/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SectionHeaderView : UICollectionReusableView {
    @IBOutlet weak var categoryTitleLabel : UILabel!
    @IBOutlet weak var categoryImageView : UIImageView!
    
    var photoCategory : PhotoCategory! {
        didSet{
            categoryTitleLabel.text = photoCategory.title
            categoryImageView.image = UIImage(named: photoCategory.categoryImageName)
        }
    }
}
