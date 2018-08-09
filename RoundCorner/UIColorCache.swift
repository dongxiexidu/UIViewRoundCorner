//
//  UIColorCache.swift
//  UIViewRoundCorner
//
//  Created by fashion on 2018/8/8.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit
import Foundation

class UIColorCache: NSObject {
    
    var colorImageCache : NSCache<NSString , UIImage>! = NSCache()
    
    static let sharedCache = UIColorCache()
    private override init() {}

    // 根据key 从缓存中获取图片
    func image(key: NSString) -> UIImage? {
        return colorImageCache.object(forKey: key)
    }
    
    // 根据key缓存中获取图片
    func setImage(image: UIImage, key: NSString) {
        colorImageCache.setObject(image, forKey: key)
    }
    
    /// 根据以下4个参数,生成key
    func getImageKey(color: UIColor,corners: UIRectCorner,borderWidth: CGFloat?, borderColor: UIColor?) -> NSString{

        let cornerStr = String(describing: corners.rawValue)
        if borderColor == nil || borderWidth == nil {
//            print(color.description)
            return color.description+cornerStr as NSString
        }
        if let borderC = borderColor,borderWidth == nil{
            return color.description+cornerStr+borderC.description as NSString
        }
        if let borderW = borderWidth, borderColor == nil{
            let borderStr = String.init(describing: borderW)
            return color.description+cornerStr+borderStr as NSString
        }
        if let borderW = borderWidth, let borderC = borderColor{
            let borderStr = String.init(describing: borderW)
            return color.description+cornerStr+borderStr+borderC.description as NSString
        }
        return color.description+cornerStr as NSString
    }
    
    
    
}
