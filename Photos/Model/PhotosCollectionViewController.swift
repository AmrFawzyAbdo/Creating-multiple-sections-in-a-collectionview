//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Apple on 1/15/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class PhotosCollectionViewController : UICollectionViewController {
    
    var photoCategories : [PhotoCategory] = PhotoLibrary.fetchPhotos()
    
    
    struct Storyboard {
        static let photoCell = "PhotoCell"
        static let sectionHeader = "SectionHeaderView"
        static let leftAndRightPadding : CGFloat = 2.0
        static let numberOfItemsPerRow : CGFloat = 3.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPadding) / Storyboard.numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
         return photoCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCategories[section].imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.photoCell , for: indexPath) as! PhotoCell
        
        let photoCategory = photoCategories[indexPath.section]
        let imageNames = photoCategory.imageNames
        let imageName = imageNames[indexPath.item]
        
        cell.imageName = imageName
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
 
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.sectionHeader, for: indexPath) as! SectionHeaderView
        let category = photoCategories[indexPath.section]
        sectionHeaderView.photoCategory = category
        return sectionHeaderView
    }
    
}
