# UIViewRoundCorner
一个非常轻量级的扩展,给UIView类型添加圆角,性能良好

## 原理: 
**在UIView的最上层绘制一张相应的遮罩图片，图片的背景只要保证和view的父视图背景色一样，就能达到圆角的效果**

- [x] 带有border的圆角
- [x] 可设置圆角位置`[.topLeft,.topRight]`
- [x] 可给矩形设置圆角
- [x] 可动态修改圆角颜色
- [x] 使用NSCache,对生成的图片进行了缓存,避免重复生成
- [x] API非常简洁
- [x] 基本不掉帧,6s真机测试非常流畅



## API
```
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
```

## 使用示例
```
// 注意:非正方形,四角圆形需要用[.topLeft,.topRight, .bottomRight, .bottomLeft]
// 而不是用UIRectCorner.allCorners
label.dx_roundCorner(radius: 20/2, cornerColor: UIColor.white,corners: [.topLeft,.topRight, .bottomRight, .bottomLeft])

// 给UIView
headView.dx_roundCorner(radii: CGSize.init(width: 35, height: 35), cornerColor: UIColor.white, corners: .allCorners, borderColor: UIColor.red, borderWidth: 2)
```

### 注意:
- **1.非正方形,四角圆形需要用[.topLeft,.topRight, .bottomRight, .bottomLeft]**
- **2.如果使用了nib文件,圆角无效,需要设置layer.masksToBounds = true**
- **3.如果需要显示tableView的选中状态,需要自己处理`setSelected`和`setHighlighted`方法,可以参考`demo`建议使用cell.selectionStyle = .none**

![效果图](https://github.com/dongxiexidu/UIViewRoundCorner/blob/master/demo.gif)

声明: 本文参考了wazrx[iOS一个简单的设置圆角不引起性能问题的分类](https://www.jianshu.com/p/ddad9e336162)Objective-C版本,并在原文上进行了改进,原文使用了运行时给分类扩展属性进行的保存[XWCornerRadius ](https://github.com/wazrx/XWCornerRadius)
