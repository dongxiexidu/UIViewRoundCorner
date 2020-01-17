//
//  CALayer+RoundCorner.swift
//  UIViewRoundCorner
//
//  Created by fashion on 2018/8/8.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit
import Foundation

fileprivate var maskCornerRaidusImageSet = [UIImage]()

extension CALayer {
    /// 设置一个四角圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - cornerColor: 圆角背景色
    public func dx_roundCorner(radius: CGFloat,cornerColor: UIColor)  {
        dx_roundCorner(radius: radius, cornerColor: cornerColor, corners: .allCorners)
    }
    
    /// 设置一个普通圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - cornerColor: 圆角背景色
    ///   - corners: 圆角位置
    public func dx_roundCorner(radius: CGFloat,cornerColor: UIColor,corners: UIRectCorner) {
        dx_roundCorner(cornerRadii: CGSize.init(width: radius, height: radius), cornerColor: cornerColor, corners: corners, borderColor: nil, borderWidth: 0)
    }
    
    ///  设置一个带边框的圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - cornerColor: 圆角背景色
    ///   - corners: 圆角位置
    ///   - borderColor: 边框颜色
    ///   - borderWidth: 边框线宽
    public func dx_roundCorner(cornerRadii: CGSize,cornerColor: UIColor, corners: UIRectCorner, borderColor: UIColor?, borderWidth: CGFloat)  {
        
        // 先从NSCach中拿,拿不到再生成
        let cacheKey = UIColorCache.sharedCache.getImageKey(color: cornerColor, corners: corners, borderWidth: borderWidth, borderColor: borderColor)
        print("--------\(cacheKey)")
        let image = UIColorCache.sharedCache.image(key: cacheKey)

        let cornerRadiusLayer = CALayer.init()
        cornerRadiusLayer.isOpaque = true
        cornerRadiusLayer.frame = self.bounds
        self.addSublayer(cornerRadiusLayer)

        if image != nil {
           // print("--------复用")
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            cornerRadiusLayer.contents = image!.cgImage
            CATransaction.commit()
        } else {

            if let image = dx_getCornerRadiusImage(cornerRadii: cornerRadii, cornerColor: cornerColor, corners: corners, borderColor: borderColor, borderWidth: borderWidth) {
                UIColorCache.sharedCache.setImage(image: image, key: cacheKey)
               // print("生成次数-----")
                CATransaction.begin()
                CATransaction.setDisableActions(true)
                cornerRadiusLayer.contents = image.cgImage
                CATransaction.commit()
            }
        }
    }
    
    
    public func dx_getCornerRadiusImage(cornerRadii: CGSize,cornerColor: UIColor, corners: UIRectCorner, borderColor: UIColor?, borderWidth: CGFloat) -> UIImage? {
 
        return UIImage.dx_maskRoundCornerRadiusImage(color: cornerColor, cornerRadii: cornerRadii, size: self.bounds.size, corners: corners, borderColor: borderColor, borderWidth: borderWidth)
    }

}
