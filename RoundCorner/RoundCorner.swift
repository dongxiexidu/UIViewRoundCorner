//
//  RoundCorner.swift
//  UIViewRoundCorner
//
//  Created by fashion on 2018/8/20.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

public protocol RoundCornerCompatible {

}

public extension RoundCornerCompatible {
    var dx : RoundCorner<Self> {
        get { return RoundCorner(self) }
    }
}

public final class RoundCorner<Base> {
    
    public let base : Base
    public init(_ base : Base){
        self.base = base
    }
}


extension UIView : RoundCornerCompatible {}

extension RoundCorner where Base: UIView{
    /// 设置一个四角圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - cornerColor: 圆角背景色
    public func roundCorner(radius: CGFloat,cornerColor: UIColor)  {
        
        base.layer.dx_roundCorner(radius: radius, cornerColor: cornerColor)
    }
    
    /// 设置一个普通圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - cornerColor: 圆角背景色
    ///   - corners: 圆角位置
    public func roundCorner(radius: CGFloat,cornerColor: UIColor,corners: UIRectCorner) {
        base.layer.dx_roundCorner(radius: radius, cornerColor: cornerColor, corners: corners)
    }
    
    ///  设置一个带边框的圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角半径
    ///   - cornerColor: 圆角背景色
    ///   - corners: 圆角位置
    ///   - borderColor: 边框颜色
    ///   - borderWidth: 边框线宽
    func roundCorner(radii: CGSize,cornerColor: UIColor, corners: UIRectCorner, borderColor: UIColor, borderWidth: CGFloat)  {
        base.layer.dx_roundCorner(cornerRadii: radii, cornerColor: cornerColor, corners: corners, borderColor: borderColor, borderWidth: borderWidth)
    }
}

