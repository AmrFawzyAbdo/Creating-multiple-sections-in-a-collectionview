//
//  Photo.swift
//  Photos
//
//  Created by Apple on 1/15/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

struct PhotoCategory{
    var categoryImageName : String
    var title : String
    var imageNames : [String]
    
//    func getPhotoCategoryDetail() -> String{
//        return ""
//    }
}

//let category = PhotoCategory(..)
//category.getPhotoCategory..()

class PhotoLibrary{
    
    
    class func fetchPhotos() -> [PhotoCategory] {
        var categories = [PhotoCategory]()
        let photosData = PhotoLibrary.downloadPhotosData()
        for (categoryTitle , dict) in photosData {
            if let dict = dict as? [String:Any] {
                let categoryImageName = dict["categoryImageName"] as! String
                if let imageNames = dict["imageNames"] as? [String]{
                    let newCategory = PhotoCategory(categoryImageName: categoryImageName, title: categoryTitle, imageNames: imageNames)
                    
                    categories.append(newCategory )
                }
            }
        }
        return categories
    }
    
    
    class func downloadPhotosData() -> [String : Any]{
        return [
            "Food" : [
                "categoryImageName" : "food" ,
                "imageNames" : PhotoLibrary.generateImage(categoryPrefix: "f", numberOfImages: 3)
            ] ,
            
            "Travel" : [
                "categoryImageName" : "travel" ,
                "imageNames" : PhotoLibrary.generateImage(categoryPrefix: "fo", numberOfImages: 3)
            ],
            
            "Nature" : [
            "categoryImageName" : "nature" ,
            "imageNames" : PhotoLibrary.generateImage(categoryPrefix: "t", numberOfImages: 3)
            ]
        ]
    }
    
    
    
    
    private class func generateImage(categoryPrefix : String , numberOfImages : Int) -> [String]{
        var imageNames = [String]()
        
        for i in 1...numberOfImages {
            imageNames.append("\(categoryPrefix)\(i)")
        }
        return imageNames
    }
}
