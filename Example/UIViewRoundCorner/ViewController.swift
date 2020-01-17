//
//  ViewController.swift
//  UIViewRoundCorner
//
//  Created by fashion on 2018/8/8.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit


let isIphoneX : Bool = kScreenH == 812.0 ? true : false
let kNavBarTotalH :CGFloat = isIphoneX ? 88 : 64
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

class ViewController: UIViewController {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    fileprivate func setupTableView(){
        
        tableView = UITableView.init(frame:CGRect(x:0, y:44, width:kScreenW, height:kScreenH ), style: .plain)
        
        if #available(iOS 11, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.ts_registerCellNib(DXTestRoundedCell.self)
    }


}
// MARK: - UITableViewDataSource,UITableViewDelegate
extension ViewController : UITableViewDataSource,UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.ts_dequeueReusableCell(DXTestRoundedCell.self)!
        let url = "https://oepjvpu5g.qnssl.com/avatar\(indexPath.row%20).jpg"
        cell.updateImageUrl(imageUrl: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

