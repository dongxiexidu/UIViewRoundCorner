//
//  UIImage+RoundCorner.swift
//  UIViewRoundCorner
//
//  Created by fashion on 2018/8/8.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

extension UIImage {
    // 提供一个在一个指定的size中绘制图片的便捷方法
    class func dx_image(size: CGSize,drawBlock : ((CGContext)->())? ) -> UIImage? {
        if drawBlock == nil {
            return nil
        }
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            drawBlock?(context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
        return nil
    }
    
    // 绘制方法的具体逻辑，遮罩图片的逻辑是绘制一个矩形，然后在绘制一个相应的圆角矩形，然后填充矩形和圆角矩形的中间部分为父视图的背景色
    class func dx_maskRoundCornerRadiusImage(color: UIColor, cornerRadii: CGSize, size: CGSize, corners: UIRectCorner, borderColor: UIColor?, borderWidth: CGFloat?) -> UIImage? {
        return UIImage.dx_image(size: size, drawBlock: { (context) in
            context.setLineWidth(0)
            color.set()
            
            let rect = CGRect.init(origin: CGPoint.zero, size: size)
            let padding : CGFloat = 0.3
            // 绘制一个矩形，这里发-0.3是为了防止边缘的锯齿
            let rectPath = UIBezierPath.init(rect: rect.insetBy(dx: -padding, dy: -padding))
            // 绘制圆角矩形，这里的0.3是为了防止内边框的锯齿
            let roundPath = UIBezierPath.init(roundedRect: rect.insetBy(dx: padding, dy: padding), byRoundingCorners: corners, cornerRadii: cornerRadii)
            
            rectPath.append(roundPath)
            context.addPath(rectPath.cgPath)
            // 注意要用EOFill方式进行填充而非Fill方式
            context.fillPath(using: CGPathFillRule.evenOdd)
            
            // 如下是绘制边框
            // 原理依旧是绘制一个外边框然后根据边框宽度绘制一个内边框同样采取EOFill的方式进行填充即可
            if borderColor == nil || borderWidth == nil {
                return
            }
            guard let borderColor = borderColor else{ return }
            guard let borderWidth = borderWidth else{ return }
            borderColor.set()
            
            let borderOutPath = UIBezierPath.init(roundedRect: rect, byRoundingCorners: corners, cornerRadii: cornerRadii)
            let borderInnerPath = UIBezierPath.init(roundedRect: rect.insetBy(dx: borderWidth, dy: borderWidth), byRoundingCorners: corners, cornerRadii: cornerRadii)
            borderOutPath.append(borderInnerPath)
            context.addPath(borderOutPath.cgPath)
            // 注意要用EOFill方式进行填充而非Fill方式
            context.fillPath(using: CGPathFillRule.evenOdd)
        })
    }

}
