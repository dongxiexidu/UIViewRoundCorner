//
//  DXTestRoundedCell.swift
//  UIViewRoundCorner
//
//  Created by fashion on 2018/8/8.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit
//import Kingfisher

class DXTestRoundedCell: UITableViewCell {

    // test
    @IBOutlet weak var topImageV: UIImageView!
    @IBOutlet weak var haadImageView: UIImageView!
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var descLabel: UILabel!
    
    var middleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
       // layer.isOpaque = true
        
        for i in 0..<10 {
            let circle = UIView()
//            circle.layer.isOpaque = true
            circle.backgroundColor = UIColor.blue
            circle.frame = CGRect.init(x: 20*i, y: 0, width: 15, height: 15)
           // let color = i % 2 == 0 ? UIColor.white : UIColor.gray
            let color = UIColor.white
            circle.dx.roundCorner(radius: 15/2, cornerColor: color)
            circleView.addSubview(circle)
        }
        let label = UILabel()
       // label.layer.isOpaque = true
        middleLabel = label
        label.backgroundColor = UIColor.green
        label.text = "aaaaaaaa"
        label.textAlignment = .center
        label.frame = CGRect.init(x: 100, y: 30, width: 100, height: 20)
        contentView.addSubview(label)
        
        // 注意:非正方形,四角圆形需要用[.topLeft,.topRight, .bottomRight, .bottomLeft]
        // 而不是用UIRectCorner.allCorners
        label.dx.roundCorner(radius: 20/2, cornerColor: UIColor.white,corners: [.topLeft,.topRight, .bottomRight, .bottomLeft])

        // 必须要加layer.masksToBounds,否则显示不出来
        descLabel.layer.masksToBounds = true
      //  descLabel.layer.isOpaque = true
        descLabel.dx.roundCorner(radius: 20/2, cornerColor: UIColor.white, corners: [.topLeft,.topRight])

        headView.dx.roundCorner(radii: CGSize.init(width: 35, height: 35), cornerColor: UIColor.white, corners: .allCorners, borderColor: UIColor.red, borderWidth: 2)
        
//        let img = UIImage.dx_maskRoundCornerRadiusImage(color: UIColor.white, cornerRadii: CGSize.init(width: 35, height: 35), size: CGSize.init(width: 70, height: 70), corners: [.topLeft, .bottomRight], borderColor: nil, borderWidth: nil)
//        topImageV.image = img
        
    }
    
    func updateImageUrl(imageUrl: String) {
        haadImageView.image = UIImage.init(named: "avatar")
       // haadImageView.kf.setImage(with: URL.init(string: imageUrl))
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        if isSelected == selected {
            return
        }
        colorSelected(selected: selected)
        super.setSelected(selected, animated: animated)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if isSelected {
            return
        }
        if self.isHighlighted == highlighted {
            return
        }
        colorSelected(selected: highlighted)
        super.setHighlighted(highlighted, animated: animated)
    }
    
    func colorSelected(selected:Bool) {
        let color = selected ? UIColor.lightGray : UIColor.white
        self.contentView.backgroundColor = color
        
        descLabel.dx.roundCorner(radius: 20/2, cornerColor: color, corners: [.topLeft,.topRight])
        middleLabel.dx.roundCorner(radius: 20/2, cornerColor: color,corners: [.topLeft,.topRight, .bottomRight, .bottomLeft])
        headView.dx.roundCorner(radii: CGSize.init(width: 35, height: 35), cornerColor: color, corners: .allCorners, borderColor: UIColor.red, borderWidth: 2)
        
        circleView.backgroundColor = color
        for item in circleView.subviews {
            item.dx.roundCorner(radius: 15/2, cornerColor: color)
        }
    }
    
}
