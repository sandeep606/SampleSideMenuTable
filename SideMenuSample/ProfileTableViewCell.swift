//
//  ProfileTableViewCell.swift
//  SideMenuSample
//
//  Created by sandeep on 15/11/17.
//  Copyright © 2017 Evontech. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    let dividerViewTag = 10
    
    let menuImageView : UIImageView = {
        let imgview = UIImageView ()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        imgview.contentMode = .scaleAspectFit
        return imgview
    }()

    let dividerView:UIView = {
        
        let view:UIView = UIView()
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let menuTitle : UILabel = {
        let lable = UILabel ()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = .white
        lable.backgroundColor = UIColor.clear
        lable.text = ""
        lable.numberOfLines = 0
        return lable
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil {
         
            self.addCellItems()
            // will use to load the setup here.
        }
    }
    
    // adding an imageview and its respective title.
    func addCellItems() -> Void {
        
        self.contentView.addSubview(menuImageView)
        self.menuImageView.image = UIImage(named: "") // image name goes here.
        self.menuImageView.backgroundColor = .red
        menuImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0).isActive = true
        menuImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 35).isActive = true
        menuImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        menuImageView.widthAnchor.constraint(equalTo: menuImageView.heightAnchor, multiplier: 1.0, constant: 0.0).isActive = true
        
        self.contentView.addSubview(menuTitle)
        menuTitle.centerYAnchor.constraint(equalTo: menuImageView.centerYAnchor, constant: 0).isActive = true
        menuTitle.leadingAnchor.constraint(equalTo: menuImageView.trailingAnchor, constant: 20).isActive = true
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data:String, indexPath:IndexPath) -> Void {
    
        menuTitle.text = data
        createAndAddDivider(forIndexPath: indexPath)
        
    }
    
    // creating a divider line
    func createAndAddDivider(forIndexPath indexPath:IndexPath){
        
        self.contentView.viewWithTag(dividerViewTag)?.removeFromSuperview()
        if indexPath.row == 0 && indexPath.section > 0{
            
            self.contentView.addSubview(dividerView)
            dividerView.tag = dividerViewTag
            dividerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
            dividerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30).isActive = true
            dividerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30).isActive = true
            dividerView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        }
        
    }

}
