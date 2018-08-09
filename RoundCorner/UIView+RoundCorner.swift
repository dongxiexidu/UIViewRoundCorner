//
//  UIView+RoundCorner.swift
//  UIViewRoundCorner
//
//  Created by fashion on 2018/8/8.
//  Copyright © 2018年 shangZhu. All rights reserved.
// 原理: 在UIView的最上层绘制一张相应的遮罩图片，图片的背景只要保证和view的父视图背景色一样，就能达到圆角的效果

import UIKit

extension UIView{

    /// 设置一个四角圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - cornerColor: 圆角背景色
    public func dx_roundCorner(radius: CGFloat,cornerColor: UIColor)  {
        self.layer.dx_roundCorner(radius: radius, cornerColor: cornerColor)
    }
    
    /// 设置一个普通圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - cornerColor: 圆角背景色
    ///   - corners: 圆角位置
    public func dx_roundCorner(radius: CGFloat,cornerColor: UIColor,corners: UIRectCorner) {
        self.layer.dx_roundCorner(radius: radius, cornerColor: cornerColor, corners: corners)
    }
    
    ///  设置一个带边框的圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - cornerColor: 圆角背景色
    ///   - corners: 圆角位置
    ///   - borderColor: 边框颜色
    ///   - borderWidth: 边框线宽
    func dx_roundCorner(radii: CGSize,cornerColor: UIColor, corners: UIRectCorner, borderColor: UIColor, borderWidth: CGFloat)  {
        self.layer.dx_roundCorner(cornerRadii: radii, cornerColor: cornerColor, corners: corners, borderColor: borderColor, borderWidth: borderWidth)
    }
}
